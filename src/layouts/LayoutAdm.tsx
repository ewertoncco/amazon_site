import React, { useState } from 'react';
import '../styles/globals.css';

interface LayoutAdmProps {
  children: React.ReactNode;
}

const LayoutAdm: React.FC<LayoutAdmProps> = ({ children }) => {
  const [sidebarOpen, setSidebarOpen] = useState(true);

  const toggleSidebar = () => {
    setSidebarOpen(!sidebarOpen);
  };

  return (
    <div className="admin-layout">
      {/* Sidebar */}
      <aside className={`sidebar ${sidebarOpen ? 'active' : ''}`}>
        <div className="sidebar-header">
          <img src="/logo.png" alt="Logo" className="logo" style={{ height: '30px' }} />
        </div>
        <div className="sidebar-content">
          <nav>
            <ul className="nav-menu">
              <li className="nav-item">
                <a href="/dashboard" className="nav-link">
                  <i className="icon">📊</i>
                  <span>Dashboard</span>
                </a>
              </li>
              <li className="nav-item">
                <a href="/eventos" className="nav-link">
                  <i className="icon">🎭</i>
                  <span>Eventos</span>
                </a>
              </li>
              <li className="nav-item">
                <a href="/vendas" className="nav-link">
                  <i className="icon">💰</i>
                  <span>Vendas</span>
                </a>
              </li>
              <li className="nav-item">
                <a href="/usuarios" className="nav-link">
                  <i className="icon">👥</i>
                  <span>Usuários</span>
                </a>
              </li>
              <li className="nav-item">
                <a href="/configuracoes" className="nav-link">
                  <i className="icon">⚙️</i>
                  <span>Configurações</span>
                </a>
              </li>
            </ul>
          </nav>
        </div>
      </aside>

      {/* Main Content */}
      <main className="main-content">
        <header className="header">
          <div className="d-flex align-items-center justify-content-between w-100">
            <button onClick={toggleSidebar} className="menu-toggle">
              <i className="icon">☰</i>
            </button>
            <div className="header-right d-flex align-items-center">
              <div className="notifications">
                <i className="icon">🔔</i>
              </div>
              <div className="user-profile">
                <img src="/avatar.png" alt="User" className="avatar" style={{ width: '32px', height: '32px', borderRadius: '50%' }} />
              </div>
            </div>
          </div>
        </header>

        <div className="content">
          {children}
        </div>
      </main>
    </div>
  );
};

export default LayoutAdm; 