
describe 'Login', :login do

    before(:each) do
        visit '/login'
    end

    it 'login com sucesso', :login_sucesso do
        fill_in 'username', with: 'stark'
        fill_in 'password', with: 'jarvis!'
        click_button 'Login'
        expect(find('#flash')).to have_content 'Olá, Tony Stark. Você acessou a área logada!'
    end

    it 'login com o nome usuario errado', :login_falha_nome do
        fill_in 'username', with: 'TonyStark'
        fill_in 'password', with: 'jarvis!'
        click_button 'Login'
        expect(find('#flash')).to have_content 'O usuário informado não está cadastrado!'
    end

    it 'login com a senha errada', :login_falha_senha do
        fill_in 'username', with: 'stark'
        fill_in 'password', with: 'jarvis!123'
        click_button 'Login'
        expect(find('#flash')).to have_content 'Senha é invalida!'
    end

    it 'login com campo em branco', :login_campo_branco do
        fill_in 'username', with: ''
        fill_in 'password', with: ''
        click_button 'Login'
        expect(find('#flash')).to have_content 'O usuário informado não está cadastrado!'
    end
end