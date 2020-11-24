
describe 'Login e Cadastro', :login_cadastro do

    before(:each) do
        visit '/access'
    end

    it 'Campo Login', :login do
        login_form = find('#login')
        login_form.find('input[name=username]').set 'stark'
        login_form.find('input[name=password]').set 'jarvis!'
        click_button 'Entrar'
        expect(find('#flash')).to have_content 'Olá, Tony Stark. Você acessou a área logada!'
    end

    it 'Campo Cadastro', :cadastro do
        login_form = find('#signup')
        login_form.find('input[name=username]').set 'peter parker'
        login_form.find('input[name=password]').set 'spiderman'
        click_link 'Criar Conta'
        expect(find('#result')).to have_content 'Dados enviados. Aguarde aprovação do seu cadastro!'
    end
end