
describe 'Upload', :upload do

    before(:each) do
        visit '/upload'
        @txt = Dir.pwd + '/spec/fixtures/arquivo.txt'
        @imagem = Dir.pwd + '/spec/fixtures/imagem.png'
    end

    it 'Upload com arquivo de texto', :txt do
        attach_file('file-upload', @txt)
        click_button 'Upload'
        expect(find('#uploaded-file').text).to eql 'arquivo.txt'
    end

    it 'Upload com imagem', :imagem do
        attach_file('file-upload', @imagem)
        click_button 'Upload'
        img = find('#new-image')
        expect(img[:src]).to include '/uploads/imagem.png'
    end
end