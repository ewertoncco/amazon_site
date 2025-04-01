import React from 'react';
import LayoutAdm from '../layouts/LayoutAdm';

const Dashboard: React.FC = () => {
  return (
    <LayoutAdm>
      <div className="row">
        <div className="col-md-6">
          <div className="card">
            <h2>Bem-vindo ao Dashboard</h2>
            <p>Este é um exemplo de página usando o layout administrativo.</p>
          </div>
        </div>
        <div className="col-md-6">
          <div className="card">
            <h2>Estatísticas</h2>
            <div className="d-flex justify-content-between">
              <div>
                <h3>Vendas</h3>
                <p>R$ 15.890,00</p>
              </div>
              <div>
                <h3>Usuários</h3>
                <p>1.321</p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </LayoutAdm>
  );
};

export default Dashboard; 