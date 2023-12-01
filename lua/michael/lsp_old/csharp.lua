local lspconfig = require("lspconfig")
local is_windows = require("michael.utils.is_windows")

local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()

local function setup_omni()
	local os_is_windows = is_windows()
	local omnisharp_bin = os_is_windows and "C:\\ProgramData\\chocolatey\\bin\\OmniSharp.exe"
	local omnisharp_conf

	if os_is_windows then
		omnisharp_conf = {
			cmd = { omnisharp_bin, "--languageserver", "--hostPID", tostring(vim.fn.getpid()) },
			capabilities = lsp_capabilities,
			root_dir = lspconfig.util.root_pattern("*.sln", "*.csproj"),
			autostart = true,
		}
		lspconfig.omnisharp.setup(omnisharp_conf)
	else
		omnisharp_conf = {
			capabilities = lsp_capabilities,
			autostart = true,
		}
		lspconfig.omnisharp_mono.setup(omnisharp_conf)
	end
end

setup_omni()
