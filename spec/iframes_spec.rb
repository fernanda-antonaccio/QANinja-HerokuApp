
describe 'Manipulando iFrames Bons e Ruins', :iframes do

    describe 'iFrames Bons', :iframe_bom do

        before(:each) do
            visit 'nice_iframe'
        end

        it 'adicionar ao carrinho', :add_refri do
            # Escopo
            within_frame('burgerId') do
                produto = find('.menu-item-info-box', text:'REFRIGERANTE')
                produto.find('a').click
                expect(find('#cart')).to have_content 'R$ 4,50'
            end
        end
    end

    describe 'iFrames Ruim', :iframe_ruim do
        
        before(:each) do
            visit 'bad_iframe'
        end

        it 'carrinho deve estar vazio' do
            script = '$(".box-iframe").attr("id", "tempId");'
            page.execute_script(script)
            # Escopo
            within_frame('tempId') do
                expect(find('#cart')).to have_content 'Seu carrinho está vazio!'
            end
        end
    end
end