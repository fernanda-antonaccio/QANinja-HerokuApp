
describe 'Modals com Sweet Alert', :modals do

    before(:each) do
        visit 'sweet_alert'
    end

    it 'Botão Sucesso', :modal_sucesso do
        click_button 'Sucesso'
        expect(find('.swal-modal').visible?).to be true
        click_button 'OK'
    end

    it 'Botão Deu Ruim', :modal_ruim do
        click_button 'Deu Ruim'
        within('.swal-modal')do
            expect(find('.swal-title')).to have_text 'Deu Ruim!'
            click_button 'OK'
        end
    end
end