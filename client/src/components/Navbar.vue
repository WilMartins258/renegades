<template>
  <nav class="nav">
    <i class="uil uil-bars navOpenBtn"></i>
    <a
      ><router-link to="/" id="logo_posicao">
        <img :src="logo" id="logo" /> </router-link
    ></a>

    <ul class="nav-links">
      <i class="uil uil-times navCloseBtn"></i>
      <li>
        <a><router-link to="/">Home</router-link></a>
      </li>
      <li>
        <a
          ><router-link to="/categoria" v-if="notIsLoginPage"
            >Categoria</router-link
          ></a
        >
      </li>
      <li>
        <a>
          <router-link to="/login" v-if="notIsLoginPage"
            >Entrar/Cadastrar</router-link
          ></a
        >
      </li>
      <li>
        <a><router-link to="/sobre">Sobre</router-link></a>
      </li>
    </ul>

    <i
      class="uil uil-search search-icon"
      id="searchIcon"
      v-if="notIsLoginPage"
    ></i>
    <div class="search-box">
      <i class="uil uil-search search-icon"></i>
      <input type="text" placeholder="Pesquise aqui..." />
    </div>
    <div>

  <img
    :src="avatarUrl"
    alt="Avatar"
    class="avatar"
    v-if="userType"
  />
  <ul class="submenu" v-show="userType">
      <li>
        <a><router-link v-show="userType === '0'" to="/usuario">Meu Perfil</router-link></a>
        <a><router-link v-show="userType === '1'" to="/AreaDoEstabelecimento">Meu Estabelecimento</router-link></a>
        <a><router-link v-show="userType === '2'" to="/AreaDoAdm">AreaDoAdm</router-link></a>
      </li>
      <li>
        <a @click="logout">Sair</a>
      </li>
    </ul>
</div>

    <link
      rel="stylesheet"
      href="https://unicons.iconscout.com/release/v4.0.8/css/line.css"
    />
  </nav>
</template>
  
<script>
export default {
  name: "Navbar",
  name: "NavigationBar",
  props: ["logo"],
  data() {
    return {
      nome: "",
      categoria: "",

    };
  },
  mounted() {
    const nav = document.querySelector(".nav"),
      searchIcon = document.querySelector("#searchIcon"),
      navOpenBtn = document.querySelector(".navOpenBtn"),
      navCloseBtn = document.querySelector(".navCloseBtn");

    searchIcon.addEventListener("click", () => {
      nav.classList.toggle("openSearch");
      nav.classList.remove("openNav");
      if (nav.classList.contains("openSearch")) {
        return searchIcon.classList.replace("uil-search", "uil-times");
      }
      searchIcon.classList.replace("uil-times", "uil-search");
    });

    navOpenBtn.addEventListener("click", () => {
      nav.classList.add("openNav");
      nav.classList.remove("openSearch");
      searchIcon.classList.replace("uil-times", "uil-search");
    });

    navCloseBtn.addEventListener("click", () => {
      nav.classList.remove("openNav");
    });
  },

  computed: {
    /*Ocultar na NavBar quando Page de login*/
    notIsLoginPage() {
      return this.$route.name !== "Login";
    },
    userType() {
      return sessionStorage.getItem("tipoUsuario");
    },
    avatarUrl() {
      // Você pode definir URLs de avatar diferentes com base no tipo de usuário, se necessário.
      // Por exemplo, dependendo do valor de userType, você pode retornar URLs diferentes.
      // Neste exemplo, usaremos uma URL fixa.
      return "https://adaptabiz.com/wp-content/uploads/2022/01/img_avatar.png";
    },
  },
  methods: {
    pesquisar() {
      // colocar a Lógica de pesquisa
    },
    logout() {
      // Limpe a sessionStorage
      sessionStorage.clear();
      // Redirecione o usuário para a página inicial
      this.$router.push({ name: 'home' });
    },
  },
};
</script>
  
<style scoped>
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  /*font-family: "Poppins", sans-serif;*/
}

.avatar {
  vertical-align: middle;
  width: 50px;
  height: 50px;
  border-radius: 50%;
}

body {
  background: #f0faff;
}

.nav {
  position: relative;
  top: 0;
  left: 0;
  width: 100%;
  padding: 15px 70px;
  background: linear-gradient(to right, #ff9800, #e91e2f); /*degradê. */
  height: 60px;
  box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
}

#logo {
  width: 100px;
  height: 40px;
}

.nav,
.nav .nav-links {
  display: flex;
  align-items: center;
}

.nav {
  justify-content: space-between;
}

a {
  color: #fff;
  text-decoration: none;
  font-weight: bold;
}

a :hover {
  color: #ffff00;
}

.nav .logo {
  font-size: 22px;
  font-weight: 500;
}

.nav .nav-links {
  column-gap: 20px;
  list-style: none;
}

.nav .nav-links a {
  transition: all 0.2s linear;
}

.nav.openSearch .nav-links a {
  opacity: 0;
  pointer-events: none;
  right: 250px;
}

.nav .search-icon {
  color: #fff;
  font-size: 20px;
  cursor: pointer;
}

.nav .search-box {
  position: absolute;
  right: 500px;
  height: 45px;
  max-width: 555px;
  width: 100%;
  opacity: 0;
  pointer-events: none;
  transition: all 0.2s linear;
}

.nav.openSearch .search-box {
  opacity: 1;
  pointer-events: auto;
}

.search-box .search-icon {
  position: absolute;
  left: 15px;
  top: 50%;
  left: 15px;
  color: #e91e2f;
  transform: translateY(-50%);
}

.search-box input {
  height: 100%;
  width: 100%;
  border: none;
  outline: none;
  border-radius: 6px;
  background-color: #fff;
  padding: 0 15px 0 45px;
}

.nav .navOpenBtn,
.nav .navCloseBtn {
  display: none;
}

/*Submenu*/
.submenu {
  position: absolute;
  top: 52px; /* Ajuste a posição vertical conforme necessário */
  right: 0;
  background: linear-gradient(to right, #ff9800, #e91e2f); /*degradê. */
  border-radius: 4px;
  box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
  padding: 15px;
  display: none;
  line-height: 1.5;
  list-style: none;
}

.avatar:hover + .submenu,
.submenu:hover {
  display: block;
}

/* responsive */
@media screen and (max-width: 1160px) {
  .nav {
    padding: 15px 100px;
  }

  .nav .search-box {
    right: 150px;
  }
}

@media screen and (max-width: 950px) {
  .nav {
    padding: 15px 50px;
  }

  .nav .search-box {
    right: 100px;
    max-width: 400px;
  }
}

@media screen and (max-width: 768px) {
  .nav .navOpenBtn,
  .nav .navCloseBtn {
    display: block;
  }

  .nav {
    padding: 15px 20px;
  }

  .nav .nav-links {
    position: fixed;
    top: 0;
    left: -100%;
    height: 100%;
    max-width: 280px;
    width: 100%;
    padding-top: 100px;
    row-gap: 30px;
    flex-direction: column;
    background: linear-gradient(to right, #ff9800, #e91e2f); /*degradê. */
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
    transition: all 0.4s ease;
    z-index: 100;
  }

  .nav.openNav .nav-links {
    left: 0;
  }

  .nav .navOpenBtn {
    color: #fff;
    font-size: 20px;
    cursor: pointer;
  }

  .nav .navCloseBtn {
    position: absolute;
    top: 20px;
    right: 20px;
    color: #fff;
    font-size: 20px;
    cursor: pointer;
  }

  .nav .search-box {
    top: calc(100% + 10px);
    max-width: calc(100% - 20px);
    right: 50%;
    transform: translateX(50%);
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
  }
}

</style>