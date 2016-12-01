<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8"/>
    <title>
      <g:layoutTitle default="Gestão de Atletas"></g:layoutTitle>
    </title>
    <asset:stylesheet href="bootstrap/bootstrap.css"></asset:stylesheet>
    <asset:stylesheet href="main.css"></asset:stylesheet>
    <asset:javascript src="jquery-3.1.1.min.js"></asset:javascript>
    <asset:javascript src="vue.min.js"></asset:javascript>
    <g:layoutHead></g:layoutHead>
  </head>
  <body>
    <header>
      <div id="logo" class="container-fluid">
        <div id="logo-inside" class="row">
          <div style="position: relative;" class="columns col-sm-12 col-md-12 col-lg-12">
            <asset:image src="layout/ga.png"></asset:image>
            <div id="mainnotificacoes" v-bind:class="{ notificacoes: quantidade &gt; 0, semnotificacoes: quantidade == 0}" v-on:click.self="expandir()">{{quantidade}}
              <div style="display: none" v-bind:style="{ display: visivel ? 'block' : 'none'}" v-if="mensagens.length &gt; 0" v-click-outside="fechanotificacoes" class="alertas"><a :href="mensagem.link" v-for="mensagem in mensagens">{{ mensagem.mensagem }}</a></div>
              <div style="display: none" v-bind:style="{ display: visivel ? 'block' : 'none'}" v-if="mensagens.length == 0" v-click-outside="fechanotificacoes" class="alertas"><span>
                  <g:message code="main.notificacoes.nonew"></g:message></span></div>
            </div>
          </div>
        </div>
      </div>
      <div id="menu" class="container-fluid">
        <div id="menu-inside" class="row">
          <div class="columns col-sm-12 col-md-12 col-lg-12">
            <ul class="menu">
              <li>
                <g:if test="${controllerName == null}"><a href="/GA" class="ativado"> 
                    <g:message code="main.menu.home"></g:message></a></g:if>
                <g:else><a href="/GA">
                    <g:message code="main.menu.home"></g:message></a></g:else>
              </li>
              <li>
                <g:if test="${controllerName == 'jogador'}"><a href="#" class="ativado"> 
                    <g:message code="main.menu.players"></g:message></a></g:if>
                <g:else><a href="#">
                    <g:message code="main.menu.players"></g:message></a></g:else>
                <ul class="submenu">
                  <li> <a href="/GA/jogador/cadastro"> 
                      <g:message code="main.menu.newplayer"></g:message></a></li>
                </ul>
              </li>
              <li>
                <g:if test="${controllerName == 'contrato'}"><a href="#" class="ativado"> 
                    <g:message code="main.menu.contract"></g:message></a></g:if>
                <g:else><a href="#">
                    <g:message code="main.menu.contract"></g:message></a></g:else>
                <ul class="submenu">
                  <li> <a href="/GA/contrato/cadastrar"> 
                      <g:message code="main.menu.newcontract"></g:message></a></li>
                </ul>
              </li>
            </ul>
          </div>
        </div>
      </div>
    </header>
    <div id="content" class="container-fluid">
      <div id="content-inside" class="row">
        <div class="columns col-sm-12 col-md-12 col-lg-12">
          <g:layoutBody></g:layoutBody>
        </div>
      </div>
    </div>
    <footer>
      <div id="footer-inside" class="row">
        <div class="columns col-sm-12 col-md-12 col-lg-12"></div>
      </div>
    </footer>
    <script>
      var v = new Vue({
      	el: '#logo',
      	directives: {
      		'click-outside': {
      			bind: function(el, binding, vNode) {
      			if (typeof binding.value !== 'function') {
      				const compName = vNode.context.name
      			let warn = `[Vue-click-outside:] provided expression '${binding.expression}' is not a function, but has to be`
      				if (compName) { warn += `Found in component '${compName}'` }
      				console.warn(warn)
      			}						const bubble = binding.modifiers.bubble
      			const handler = (e) => {
      				if (bubble || (!el.contains(e.target) && el !== e.target)) {
      				binding.value(e)
      			}
      			}
      			el.__vueClickOutside__ = handler
      	        document.addEventListener('click', handler)
      			},
      			unbind: function(el, binding) {
      			document.removeEventListener('click', el.__vueClickOutside__)
      			el.__vueClickOutside__ = null
      
      			}
      		}
      	},
      	data: {
      		mensagens: [
      			//- {
      			//- 	mensagem: "blablablablaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
      			//- 	hora: "10/10/2010 - 13:20",
      			//- 	lida: false,
      			//- 	link: "#"
      			//- },
      			//- {
      			//- 	mensagem: "blablablabla",
      			//- 	hora: "10/10/2010 - 13:20",
      			//- 	lida: false,
      			//- 	link: "#"
      			//- }
      		],
      		visivel: false,
      		btnclicado: false
      	},
      	computed: {
      		quantidade: function() {
      			var q = 0;
      			for(var i = 0; i < this.mensagens.length; i++) {
      				if(this.mensagens[i].lida == false) {
      					q++;
      				}
      			}
      			return q;
      		}				
      	},
      	methods: {
      		expandir: function() {
      			this.visivel = !this.visivel ? true : false;
      			
      			var self = this;
      			$.ajax({
      				url: '/GA/notificacao/lidas',
      				method: 'GET',
      				success: function (data) {
      					for(var i = 0; i < self.mensagens.length; i++) {
      						self.mensagens[i].lida = true;
      					}
      				},
      				error: function (error) {
      					console.log(JSON.stringify(error));
      				}
      			});
      
      			this.btnclicado = true;
      		},
      		fechanotificacoes: function() {
      			this.visivel = (this.btnclicado && this.visivel) ? true : false
      			this.btnclicado = false;
      		}
      	},
      	created: function () {
      		var self = this;
      		$.ajax({
      			url: '/GA/notificacao/leitura',
      			method: 'GET',
      			success: function (data) {
      				self.mensagens = data;
      			},
      			error: function (error) {
      				console.log(JSON.stringify(error));
      			}
      		});
      	}
      });
    </script>
  </body>
</html>
