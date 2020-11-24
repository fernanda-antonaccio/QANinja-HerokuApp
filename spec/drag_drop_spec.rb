
describe 'Drag and Drop', :drag_drop do 

    before(:each) do
        visit 'drag_and_drop'
    end
 
    it 'Imagem muda para Team Stark', :team_stark do
        stark = find('.team-stark .column')
        spider = find('img[alt="Homem Aranha"]')
        spider.drag_to stark
        expect(stark).to have_css 'img[alt="Homem Aranha"]'
    end

    it 'Imagem muda e retorna para Team Cap', :team_cap do
        
        spider = find('img[alt="Homem Aranha"]')
        
        stark = find('.team-stark .column')
        spider.drag_to stark
        expect(stark).to have_css 'img[alt="Homem Aranha"]'

        cap = find('.team-cap .column')
        spider.drag_to cap
        expect(cap).to have_css 'img[alt="Homem Aranha"]'
    end
end