(function() {

  function updateTextContent(id, body) {
    var elementVar = document.getElementById(id);
    elementVar.textContent = body;
  }

	var story;

    var storyContainer = document.querySelectorAll('#story')[0];

	fetch('story.json')
	.then(function(response){
		return response.text();
	})
	.then(function(storyContent){
		story = new inkjs.Story(storyContent);
		continueStory();
	});

    function showAfter(delay, el) {
        setTimeout(function() { el.classList.add("show") }, delay);
    }

    function scrollToBottom() {
        var progress = 0.0;
        var start = window.pageYOffset || document.documentElement.scrollTop || document.body.scrollTop || 0;
        var dist = document.body.scrollHeight - window.innerHeight - start;
        if( dist < 0 ) return;
        var duration = 300 + 300*dist/100;
        var startTime = null;
        function step(time) {
            if( startTime == null ) startTime = time;
            var t = (time-startTime) / duration;
            var lerp = 3*t*t - 2*t*t*t;
            window.scrollTo(0, start + lerp*dist);
            if( t < 1 ) requestAnimationFrame(step);
        }
        requestAnimationFrame(step);
    }

  function continueStory() {
    var paragraphIndex = 0;
    var delay = 0.0;

    var groupElement = document.createElement('div');
    groupElement.classList.add("paragraph-group");

    // Generate story text - loop through available content
    while(story.canContinue) {

      // Get ink to generate the next paragraph
      var paragraphText = story.Continue();

      // Create paragraph element
      var paragraphElement = document.createElement('p');
      paragraphElement.innerHTML = paragraphText;
      groupElement.appendChild(paragraphElement);

      // Fade in paragraph after a short delay
      showAfter(delay, paragraphElement);

      delay += 200.0;
    }
    storyContainer.appendChild(groupElement);
    // Create HTML choices from ink choices
    story.currentChoices.forEach(function(choice) {

      // Create paragraph with anchor element
      var choiceParagraphElement = document.createElement('p');
      choiceParagraphElement.classList.add("choice");
      choiceParagraphElement.innerHTML = `<a href='#'>${choice.text}</a>`
      storyContainer.appendChild(choiceParagraphElement);

      // Fade choice in after a short delay
      showAfter(delay, choiceParagraphElement);
      delay += 200.0;

      // Click on choice
      var choiceAnchorEl = choiceParagraphElement.querySelectorAll("a")[0];
      choiceAnchorEl.addEventListener("click", function(event) {

        // Don't follow <a> link
        event.preventDefault();

        // Remove all existing choices
        var existingChoices = storyContainer.querySelectorAll('p.choice');
        for(var i=0; i<existingChoices.length; i++) {
          var c = existingChoices[i];
          c.parentNode.removeChild(c);
        }

        // Tell the story where to go next
        story.ChooseChoiceIndex(choice.index);

        // Aaand loop
        continueStory();
      });
    });

    updateTextContent(
      "block_name",
      "???????? " + story.EvaluateFunction("gen_block_name")
    );
    updateTextContent (
      "civil",
      story.variablesState["CIVIL"]
    );
    updateTextContent (
      "labor",
      story.variablesState["LABOR"]
    )
    updateTextContent (
      "military",
      story.variablesState["MILITARY"]
    )
    updateTextContent (
      "sciencists",
      story.variablesState["SCIENCISTS"]
    )
    updateTextContent (
      "outlaws",
      story.variablesState["OUTLAWS"]
    )
    updateTextContent (
      "concentrat",
      story.variablesState["CONCENTRAT"]
    )
    updateTextContent (
      "turn",
      story.variablesState["TURN"]
    )

    // scrollToBottom();
    // scroll
    var objDiv = document.getElementById("story");
      objDiv.scrollTop = objDiv.scrollHeight;
    }

})();
