
describe 'Buscando IDs Dinamicos com Regex', :id_dinamico do

    before(:each) do
        visit '/access'
    end

    it 'Cadastro com Id', :cadastro_id do
        find('#PortalTheme_wt10_block_wtcontent_holder_wt8_wtUsernameInput').set 'Fernanda'
        find('#PasswordInput_wt11_PortalTheme_wt7_block_wtcontent_holder_wt8_wt').set '123456'
        find('#PortalTheme_wt4_block_wtGetStartedButton_wtcontent_holder_OSCore_wt3_block').click
        expect(page).to have_content 'Dados enviados. Aguarde aprovação do seu cadastro!'
    end

    it 'Cadastro com expressão regular', :cadastro_regular do 
        find('input[id*=UsernameInput]').set 'Fernanda'
        find('input[id*=PasswordInput]').set '123456'
        find('a[id*=PortalTheme]').click
        expect(page).to have_content 'Dados enviados. Aguarde aprovação do seu cadastro!'
    end
end