
describe 'Alterando Janelas', :windows do

    before(:each) do
        visit '/windows'
    end

    it 'nova janela' do
        # window_opened_by = Abre a nova janela por/pelo click_link 'Clique aqui'
        novaJanela = window_opened_by { click_link 'Clique aqui'}
        within_window -> { page.title == 'Nova Janela'} do #Nome da nova aba
            expect(page).to have_content 'Aqui temos uma nova janela \o/'
        end
        # fecha janela
        novaJanela.close
    end
end