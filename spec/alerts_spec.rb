
describe 'JavaScript Alerts', :alerts do

    before(:each) do
        visit 'javascript_alerts'
    end

    it 'JavaScript Alerta', :alert do
        click_button 'Alerta'
        msg = page.driver.browser.switch_to.alert.text # text = pega o texto no alerta
        expect(msg).to eql 'Isto é uma mensagem de alerta'
    end

    it 'JavaScript Confirma', :confirm_accept do
        click_button "Confirma"
        msg = page.driver.browser.switch_to.alert.text
        expect(msg).to eql 'E ai confirma?'
        page.driver.browser.switch_to.alert.accept # accept = clicar no botão confirma
        expect(page).to have_content 'Mensagem confirmada'
    end

    it 'JavaScript não Confirma', :confirm_dismiss do
        click_button "Confirma"
        msg = page.driver.browser.switch_to.alert.text
        expect(msg).to eql 'E ai confirma?'
        page.driver.browser.switch_to.alert.dismiss # dismiss = clicar no botão cancela
        expect(page).to have_content 'Mensagem não confirmada'
    end

    it 'JavaScript Prompt Confirma', :prompt_accept do
        #deve aceitar inserir Fernanda quando clicar no botão Prompt
        accept_prompt(with: 'Fernanda') do
            click_button "Prompt"
        end
        expect(page).to have_content 'Olá, Fernanda'
    end

    it 'JavaScript Prompt não Confirma', :prompt_dismiss do
        #deve cancelar quando clicar no botão Prompt
        dismiss_prompt(with: 'Fernanda') do
            click_button "Prompt"
        end
        expect(page).to have_content 'Olá, null'
    end
end