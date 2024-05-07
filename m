Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9E14C25B4F
	for <webhook@archiver.kernel.org>; Tue,  7 May 2024 17:33:19 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.315.1715103198939467684
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 07 May 2024 10:33:19 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 89CEEDA7
	for <meta-arm@lists.yoctoproject.org>; Tue,  7 May 2024 10:33:44 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 598723F587
	for <meta-arm@lists.yoctoproject.org>; Tue,  7 May 2024 10:33:18 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 5/6] arm/optee: update to 4.2.0
Date: Tue,  7 May 2024 13:33:12 -0400
Message-Id: <20240507173313.50788-5-jon.mason@arm.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20240507173313.50788-1-jon.mason@arm.com>
References: <20240507173313.50788-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 07 May 2024 17:33:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5702

Update to the latest version of OP-TEE and move the 4.1 recipes still
being used to meta-arm-bsp

Changes in optee_client between f7e4ced15d1fefd073bbfc484fe0e1f74afe96c2 =
and 3eac340a781c00ccd61b151b0e9c22a8c6e9f9f0
3eac340a781c libteec: Move OP-TEE defined fields into an imp struct
7749688eb18d libteeacl: add pkgconfig file: teeacl.pc
07d2dfab2ecb libteec: pkgconfig: remove duplicate flags in teec.pc
6f992c52a8df libteec: pkgconfig: rename libteec.pc as teec.pc
cef6c7eca494 tee-supplicant: fix potential crash when TA isn't found
c5b3920f5808 libckteec: one shot encryption/decryption may have no input =
data
afbd31d9592e android: convert .mk files to .bp
bfe37714c20c libteec: drop benchmark framework support

Changes in optee_os between 18b424c23aa5a798dfe2e4d20b4bde3919dc4e99 and =
12d7c4ee4642d2d761e39fbcf21a06fb77141dea
12d7c4ee4642 Update CHANGELOG for 4.2.0
fc57019cb35c plat-sam: add support for Microchip sama7g54-ek board
d10f2b2505b1 plat-sam: rename filename for sama5d2 functions to 'platform=
_sama5d2.c'
a557f87762b1 plat-sam: optimize the macro and makefile for building sama5=
d2 clocks
3b616eeadd7a drivers: atmel_wdt: update "#include" list of the header fil=
es
d8af06119772 drivers: atmel_wdt: remove the unused variable from "struct =
atmel_wdt"
ea9329ec8928 drivers: atmel_wdt: upgrade to support sama7g5 watchdog
a471cdecfb1c core: reset cancellation mask on TA exit
021a43d32b23 ci: add QEMUv7 job
46fdfeea761f vexpress-qemu_armv8a: increase CFG_CORE_HEAP_SIZE to 131072
bdde1c9927e8 drivers: stm32_i2c: protect bus access with a mutex
cbb0a9fc4309 drivers: firewall: stm32_rifsc: remove use of CFG_PM
cc707b8570d3 drivers: stm32_rng: remove use of CFG_PM
299f9bc19fce drivers: crypto: stm32_cryp: add pm to CRYP driver
14d68630950a drivers: crypto: stm32_cryp: add delay when resetting CRYP p=
eripheral.
1d8b1184c370 drivers: crypto: stm32_cryp: remove reset binding requiremen=
ts
a8cfcdf2387c ci.yml: add a make command to build HPRE code
9e25528294eb drivers: crypto: hisilicon: init HPRE hardware block
ee726ae9537e ci: remame WD to OPTEE_OS_TO_TEST
4f00b5beb8db ci: update QEMUv8 jobs to use newer Docker image
344ef8a4deda core: kernel: Fix typo in __do_panic()
c80790fe23c5 drivers: regulator: use mutex_pm_aware
9a3248fc031e drivers: clk: replace clock main spinlock with a mutex
3a20c6612811 core: kernel: mutex compliant with PM sequences
f6412fbd119a core: kernel: thread spin locking
19ad526cb139 core: spmc, sp: cleanup FF-A ID handling
4c4387dc246e core: riscv: Prepare SATP for each hart
fe9a26822286 core: riscv: Allocate root page table for each hart
6d7d9de348ec ci: qemuv8: add test case with CFG_WITH_PAGER=3Dy
23f867d38149 core: arm64: increase STACK_ABT_SIZE from 1024 to 3072 when =
log level is 0
1cf7e98d072c core: replace REGISTER_TIME_SOURCE()
63bfec5e264b core: riscv: Apply SM-based boot flow for secondary harts
058cf7120c26 core: riscv: Do not restrict primary hart to hart ID 0 only
1706a2840a9a core: riscv: Change the condition of communication with untr=
usted domain
83abc78438b4 riscv: plat-virt: Set CFG_RISCV_WITH_M_MODE_SM as 'y'
a30b4486180b core: riscv: Add CFG_RISCV_WITH_M_MODE_SM and dependency che=
cking
ea11f51262ac core: riscv: Apply mask/unmask exceptions when operating pag=
e table
d1d1ca2347e7 core: riscv: Apply STATUS helper for RPC resume
de45f2fb6384 core: riscv: Apply exception return to handle_user_mode_pani=
c()
4fe3a3f7bf3c core: riscv: Refine thread trap handler
b5bb30b389ae core: riscv: Refine thread enter/exit user mode
09653bca94ae core: riscv: Apply exception return to resume thread
b2f99d2027f6 core: boot: fix memtag init sequence
5d2d37cd756d ta: pkcs11: Clarify context reference in step_symm_operation=
()
3844bc9816af core: introduce CFG_NOTIF_TEST_WD
82631bd42041 core: add CFG_CALLOUT
fc59f3d86e9f core: notif: assert callback is unpaged
c5b5aca0eaef core: callout: assert callback is unpaged
fd3f2d693456 core: add missing DECLARE_KEEP_PAGER()
7c9a7b0c779e plat-synquacer: use cpu_spin_lock_xsave() and friend
21773c96f4c2 core: arm: mm: use thread_unmask_exceptions() where applicab=
le
54df46b5c06c core: arm: use cpu_spin_lock_xsave() in generic timer implem=
entation
ad50321f47fd ta: remoteproc: allow remoteproc_load_fw re-entrance
47bcc886c285 core: notif_send_async(): remove debug print
1c3c4a5ffb52 core: tests: add a notification test watchdog
d378a547e848 plat-vexpress: qemu_armv8: define IT_SEC_PHY_TIMER
b008cf009961 plat-vexpress: initialize callout service
5b7afacfba96 core: arm64: implement timer_init_callout_service()
c41db53b5f25 core: define generic callout service initializer
cf707bd0d695 core: add callout service
2d8644ee993a core: arm64: add {read,write}_cntps_cval()
a355270852c7 drivers: clk: clk-stm32mp13: fix memory corruption on oscill=
ator parent
622eef2d5511 plat-synquacer: add initialization value to local variables
b4d1c08a65d6 drivers: regulator: do not cache voltage level value
c4cdfb70e19b core: add __must_check attribute to cpu_spin_lock_xsave()
ccd64a523ab3 core: kernel: add timeout_elapsed_us()
fab37ad7dc71 core: kernel: factorize delay and timeout implementation
51b745fab86c core: riscv: force enable of CFG_CORE_HAS_GENERIC_TIMER
6b0ac81dbe5f core: kernel: describe udelay()/mdelay()
f5305d4dd98c plat-vexpress: disable PL011-specific code when CFG_SEMIHOST=
ING_CONSOLE=3Dy
a9a3bf985e5d core: arm64: implement __do_semihosting() for Aarch64
31bb491f8e7c core: imx: enable TZC380 driver for all i.mx8m socs
d1c9f59a15c8 riscv: sbi_console: prefer SBI v2.0 DBCN ecall over legacy s=
bi_console_putchar()
76a2df57b630 riscv: sbi_console: remove unused sbi_console_flush()
db96d03011d3 riscv: sbi_console: remove global spinlock
4d36f99e02cb riscv: sbi_console: remove unneeded #ifdef CFG_RISCV_SBI_CON=
SOLE
2b31189c4c08 riscv: sbi_console: split FID 0 from SBI_EXT_0_1_CONSOLE_PUT=
CHAR
286e0fd9f01a riscv: sbi: minor cleanup for SBI HSM related definitions
d6a0fc9bb910 dts: at91: add device trees for sama7g54_ek
74fbd2732948 drivers: clk: sam: skip the NULL clocks when getting the clo=
ck by name
943d822aac00 drivers: clk: sam: add sama7g5 clock description
8bd542fcb2ae dts: sama5d2: add huk node for the NVMEM hardware unique key
6c6c4d9eb45d dts: sama5d2: add NVMEM die_id node
f673afe436c9 plat-sam: enable NVMEM unique hardware key and die id suppor=
t
fc7169686724 drivers: nvmem: add nvmem-huk driver
31a85db883c5 drivers: nvmem: add nvmem-die-id driver
458ef4426c2d drivers: Implement semihosting based console driver for log
55ab8f06a831 core: Refactor console_init() and introduce plat_console_ini=
t()
6d716a4b4588 core: riscv: Add semihosting.S for semihosting instructions
7e2a10389c25 core: kernel: Add semihosting functions
f459d3c7d2e1 libutils: Import part of sys/fcntl.h
c6a18428f9e3 plat-sam: implement plat_get_freq() for sama7g5
eb3951bffd95 plat-sam: register additional sama7g5 clocks for SCMI usage
609ba8e3128d plat-sam: register sama7g5 clocks for SCMI usage
f8c1dacbeef9 drivers: clk: make API function description more consistent
821cb656cbb2 drivers: clk: get stm32mp13 PLL output clock duty cycle
1bc6d1bc0945 drivers: clk: set stm32mp13 clock flags
8baaac1ce3ac drivers: clk: pre-enable new parent on clock re-parent
8fbc005673cd drivers: clk: get linear rates description
20f97d9841ac drivers: clk: enable clock on rate change
0ba7ae74a1ff drivers: clk: change parent clock rate if needed
05771552b189 drivers: clk: Get duty cycle from parent clock
59db7f68c4d8 drivers: clk: Add clock duty cycle
0d98c255fb4d plat-stm32mp2: add pm support on stm32mp25
9a4ec17240c1 core: pm: add macro for PM_HINT_STATE access
b8514c1376b1 plat-sam: fix static shared memory address and size
58dbe3dff530 plat-mediatek: add support for MT7988 SoC
4318c69fa77d drivers: clk: sam: add PLL clock driver for sama7g5
9aab6fb2f263 drivers: clk: sam: update to support generic clock for sama7=
g5
5110b3e7ade5 drivers: clk: sam: update to support main system bus clock f=
or sama7g5
40944c5ccf0b .gitignore: Ignore all dot files and folders except the stan=
dard ones
5b4a782ebccf .gitignore: Change entries to only ignore in the source root=
 folder
7f124eb8587b core: arm: kernel: add runtime check for CE
f73f678ca5c6 core: arm: add helper functions for checking CE support
a0635f174d2f core: arm: add check in aarch32 for feat_crc32_implemented()
8a4a051b3a76 core: arm64: remove ID_AA64ISAR0_EL1 macros
443b5e0186c0 core: arm: rewrite feat_crc32_implemented()
f9aaf11e8928 core: arm64: add masks for ID_AA64ISAR0_EL1 fields
85c99f3965f6 core: arm: add masks for ID_ISAR5_EL1 fields
4078bcde942c core: virt, ffa: keep guest partition until resources are re=
claimed
3e0b361ef4fd core: ffa: store shm_bits in partition for SPMC at S-EL1
070d197fa568 core: ffa: add SPMC_CORE_SEL1_MAX_SHM_COUNT
05c6a7631891 core: thread_spmc.c: add set_simple_ret_val()
27acbe2b64fc ci: add RISC-V build (rv64, PLATFORM=3Dvirt)
2825530b3637 mk/lib.mk: add library to link line only when it does contai=
n objects
339a78c2743f libunw: riscv: simplify architecture test
9fed4516d1f0 libunw: arm: unwind_arm32.c should be compiled only for Arm
209c34dc0356 ldelf: riscv: e64_relocate(): tag sym_idx as __maybe_unused
31bcbe52258e riscv: set default cross-compilers
6c2d2e8a2300 core: gic: wait for writes to propagate
9e935234082a core: gic: support to configure PPI interrupts
49d0c90dd69a core: call init_multi_core_panic_handler() earlier
d5dc9152c8ef core: riscv: Fix PTE creation when freeing PTE
e6a66e30cd41 core: riscv: Rename mattr_to_perms() to mattr_to_pte_bits()
da1a293e65b5 drivers: clk: clk-stm32mp13: round up VCO to the nearest fre=
quency
95f2142bf848 drivers: clk: clk-stm32mp13: don't gate/ungate oscillators n=
ot wired
e84c299885a7 drivers: clk: clk-stm32mp13: add ADC and SPI clocks
571857c05c40 ta: pkcs11: factorize second operation handle
63778faac4b7 ta: pkcs11: implement AES GCM operations
5fee6cc9826f ta: pkcs11: pkcs11_ta.h: define PKCS11_CKM_AES_GCM
a2c1c8e408d3 core: mmu: add MEM_AREA_ROM_SEC in check_mem_map()
3b3dff5f5652 MAINTAINERS: update NXP i.MX platforms and Crypto Driver Int=
erface
35a9139e779f drivers: caam: add CAAM key support for DH
8993bfd8dbab drivers: caam: add CAAM key support for ECC
014494479f9d drivers: caam: add CAAM key support for DSA
ccbcceeb73c1 drivers: caam: add CAAM key support for RSA
1495f6c4a82a drivers: caam: add CAAM key driver
9d38cd9151e9 drivers: caam: fix DSA_DUMPDESC macro
a5b52f5092a0 drivers: caam: add missing header
2d53e979f05a drivers: caam: add class field to FIFO_ST macro
f8388fdc2f3e core: move CFG_CORE_BIGNUM_MAX_BITS default definition
9e35f116f9bd dts: stm32: add RIFSC compatible to RIFSC node in stm32mp251=
.dtsi
d6a8ef58da15 dts: stm32: Add RIFSC configuration support for stm32mp257f-=
ev1
82e290753e45 plat-stm32mp2: conf: enable RIFSC driver
196cb5a09923 dt-bindings: add RIFSC to default bindings config for STM32M=
P25
066c3a39a4ac dt-bindings: add RIFSC bindings
cd187630b280 drivers: add stm32 RIFSC support
203147e2b737 plat-stm32mp2: conf: support RIF driver
0179d5f8d520 dt-bindings: add RIF to default bindings config for stm32mp2=
5
e1767b3b5dc4 dt-bindings: firewall: add RIF bindings
1506f47af917 drivers: firewall: add stm32_rif driver for common RIF featu=
res
98d105a565ce core: io: fix IO_READ32_POLL_TIMEOUT() when delay is 0us
cf2c8f0959af libutils: Implement speculation barrier for RISC-V
407023cade6b plat-stm32mp1: default enable SAES software fallback
03de2c7bb316 drivers: crypto: stm32_saes: fallback to software on 192bit =
AES keys
99205375555b drivers: crypto: stm32: cleanup cipher operation structure
496497dc1a00 drivers: crypto: stm32: move context allocation/free functio=
ns
061e13f64e84 drivers: crypto: stm32: clean function references
57ad00904006 plat-hikey: Replace register_dynamic_shm() with register_ddr=
()
eee73fd09042 plat-hikey: make DRAM1_BASE configurable
4c2665755e26 drivers: clk: sam: update to support slow clock for sama7g5
afb609395def drivers: clk: sam: add PMC definitions for sama7g5
29f0ec7152e4 drivers: clk: sam: add UTMI clocks for sama7g5 USB PHY
417a10d1fa23 drivers: clk: sam: update UTMI clock for sama7g5
09c44b0d8b97 driver: crypto: hisilicon: fix error handling
4199b52fe3b8 core: notif_register_driver() assert ndrv is nexus memory
7037ff8aaede core: move _time_source into __nex_bss
dcad180014e0 core: add nex_*init-calls
3d52f27cdb77 core: move multi_core_panic_handler into __nex_data
ba4f5940f45a core: add is_nexus() and refactor is_unpaged()
897aaf117e39 ta: pkcs11: fix build warning on unused arguments
d99b271aed2f drivers: se050: fix default configuration for the SE applet
974529332ded core: kernel: fix typo in huk_subkey.h inline comment
a7400fcded79 core: arm: fix lock in virt_add_cookie_to_current_guest()
89853006a609 core: crypto: fix crypto_asym_get_ecc_keypair_ops() stub
fa1950059f41 ci: qemuv8: preventively avoid "no space left on device" err=
ors
ad194957b670 core: pta: widevine: Add the init implementation
64086346d6bc core: dts: lx2160a: add memory region
439c5ecbb68b core: arm: fix integer overflow in generic_timer_{handler,st=
art}()
c847c2c9c62f ci: update actions/checkout@v3 to v4
c83a542f3734 drivers: crypto: stm32: fix SAES key selection
b8f45155eac7 ci: xen: fix "no space left in device" error"
b066e82535aa plat-vexpress: use serial callbacks rx_intr_{en,dis}able()
6d9ff02ee1f3 core: pl011: implement rx_intr_{enable,disable}() callbacks
e934bfa424d2 core: serial: add rx_intr_{enable,disable}() callbacks
fcabe15c7783 core: crypto: fix internal AES-GCM counter implementation
b4d33ca3ff42 core: ltc: add missing string_ext.h include
64a52f9dc228 drivers: clk: fix indentation in stm32mp13 clock driver
f4dba32508be drivers: clk: fix some stm32mp13 clock controls
a32213b8169c drivers: clk: fix stm32mp13 RNG1 parent clock
d615a7e62095 drivers: regulator: list voltages controlled by a GPIO
bbc33e2ad79c core: ls: correct CFG_CORE_ARM64_PA_BITS for LX2160A-RDB/QDS
5a982d0e96be core: dt: provide stubbed dt_getprop_as_number()
55cd94d198a5 core: ffa: add notifications with SPMC at S-EL2 or EL3
4965507859bb core: hfic: fix HF_INTERRUPT HVC calls
e37b526d7289 core: move hafnium.h into hfic.c
6959d59f0966 core: ffa: exit with native interrupts unmasked
55a80fa9b542 core: arm64.h: add DAIFBIT_{NATIVE,FOREIGN}_INTR
012cdca49db3 plat-k3: drivers: sec_proxy: increment while reading trail b=
ytes
cb30e9d11a16 plat-stm32mp2: default enable embedded test
14c31b4fae40 plat-stm32mp2: allow up to 8GB of external RAM
774dc8aa526b ci: do not add $HOME/.cargo/bin to $PATH
d557d174c2d6 drivers: atmel_rstc: add the function to control sama7g5's U=
SB reset
024af21c74ff drivers: atmel_tcb: update to compatible with sama7g5
7a6bbd59ef0b drivers: atmel_pio: update to compatible with sama7g5
f527a3b76ed8 drivers: atmel_shdwc: update to compatible with sama7g5
e5dba60318b1 driver: crypto: hisilicon: update qm init configs
851d05e65f9c core: riscv: Add .sbss and .sdata sections to linker script
e07f9212d5ad plat-stm32mp1: shared_resource: disable MCKPROT if not neede=
d
6f3fc05370ef drivers: caam: sm2 operation fallback
963a90d842b5 drivers: caam: add caam_hal_rng_pr_enabled() for 8QX, 8DX pl=
atforms
54d90e3f0b47 plat-stm32mp2: conf: default enable RNG and RNG PTA
b82b7e73f63e drivers: stm32_rng: print RNG version at driver probe time
aa12f203f239 drivers: stm32_rng: put max noise freq in compatible data
5959d83f6f58 drivers: stm32_rng: move RNG configuration to compat data
45da6509d925 drivers: stm32_rng: add stm32mp25 support
59fea6838b20 core: pta: drop benchmark
a6f60e0f08a7 arm: plat: rcar: gen4: adjust memory map
e7dd9fbb056e arm: virtualization: don't allow hypervisor to issue std cal=
ls
6370f75d6fcc drivers: sam: use header file "platform_config.h" instead of=
 "sama5d2.h"
fd286f75cf55 drivers: atmel_rtc: update to compatible with sama7g5
379dc2ae943d drivers: atmel_rstc: update to compatible with sama7g5
cc105e35cbdc drivers: atmel_trng: update to compatible with sama7g5
4b17205bb971 drivers: atmel_piobu: update compatible with sama7g5
c37489baeb29 core: msg_param: remove recursion in included headers
4584d00c9f44 ldelf: check val for NULL dereference
239fae350391 core: tee: initialize dirfile|tadb_entry objects
a2431e9f66cb ta: pkcs11: check returned value of mbedtls_pk_rsa()
fa21a1fb4c6c core: check if string to uuid conversion succeed
2cc2a44c9fce core: check if binary to bignum conversion succeed
8f3afe0e6e8f core: mmu: assert pointer to manifest device tree
a039ffc675d3 core: kernel: dt: check return values from snprintf()
b51aaa628c7c core: arm: fix dead code when ARM32 is not defined
e33c3ff5e9f0 core: kernel: check device tree property pointer
49286073c91e ldelf: remove unnecessary includes
4bc2a199d122 ta: remove unnecessary includes
5ca2c36555d1 core: remove unnecessary includes
34d6dc2ba938 plat-vexpress: remove unnecessary includes
c344db981197 riscv: mm: Set A/D bits of PTE(page table entry) by default
472c70be1569 core: riscv: Rename thread_return_to_ree() to thread_return_=
to_udomain()
655625e01f36 core: ffa: Read FF-A version from the SP manifest
602ff4f69104 pta: scmi: remove noisy info level message on message proces=
s
3f7122d9c558 drivers: scmi_msg: fix size_t trace format
37fbce01492d drivers: stm32_i2c: fix header file inclusion order
5395fe8961bc drivers: i2c: add missing __unused in stubbed function
8a6ca1480ddc core: arm: get DDR range from embedded DTB
c425380f2021 driver: i2c: stm32_i2c: fix call to stm32_i2c_init()
2b9d76616422 drivers: stm32_i2c: apply pinctrl config at init
87aead6ffab3 drivers: stm32_i2c: analog filter config cannot fail

Changes in optee_test between 2e1e7a9c9d659585566a75fc8802f4758c42bcb2 an=
d 526d5bac1b65f907f67c05cd07beca72fbab88dd
526d5bac1b65 gp: update API files to use the imp field in TEEC_Session
a79e6ee457b6 regression_1025: use the imp field in TEEC_Context
dda3212f244f xtest: add SM4 perf test
3feb4fbbb19d ta: os_test: Unmask cancellation from invoke command handler
a641f180d847 xtest: pkcs11_1030: Test AES GCM processing
ea18800d10ce xtest: pkcs11_1006: Test AES GCM mode flag
96f6dd7db7b9 xtest: pkcs11_1005: Test AES GCM support flag
ac200fe2ae40 xtest: asym_perf: fix indentation issues
79ba734b5ff5 ta: crypto_perf: correct coding style issue in symm tests
babafcabdc2b ta: crypto_perf: fix coding style issues in asymm tests
bad11a957a6d ta: crypto_perf: fix build error on type mismatch
cb5136a47bb3 ta: crypto_perf: fix build warning on unused resources
967368b3c7bf regression_4000: check if the generated DH private key is a =
CAAM black key
4b4caf762cc2 ci: avoid "No space left on device" error
bcd55831e1f7 xtest: add asymmetric cipher perf test
14a2b2ac3db4 ta: crypto_perf: add asymmetric crypto perf tests
99d5c298ff03 xtest: pkcs11_1001: Test CK_UNAVAILABLE_INFORMATION output v=
alue
9d566212b3ce regression 4005: Add GCM counter overflow test vectors

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../0003-optee-enable-clang-support.patch     | 30 +++++++++++++++++++
 .../recipes-security/optee/optee-os_4.1.0.bb  |  0
 ...-client_4.1.0.bb =3D> optee-client_4.2.0.bb} |  2 +-
 ...mples_4.1.0.bb =3D> optee-examples_4.2.0.bb} |  0
 ...it_4.1.0.bb =3D> optee-os-tadevkit_4.2.0.bb} |  0
 .../recipes-security/optee/optee-os_4.2.0.bb  | 10 +++++++
 ...ptee-test_4.1.0.bb =3D> optee-test_4.2.0.bb} |  2 +-
 7 files changed, 42 insertions(+), 2 deletions(-)
 create mode 100644 meta-arm-bsp/recipes-security/optee/optee-os/0003-opt=
ee-enable-clang-support.patch
 rename {meta-arm =3D> meta-arm-bsp}/recipes-security/optee/optee-os_4.1.=
0.bb (100%)
 rename meta-arm/recipes-security/optee/{optee-client_4.1.0.bb =3D> optee=
-client_4.2.0.bb} (71%)
 rename meta-arm/recipes-security/optee/{optee-examples_4.1.0.bb =3D> opt=
ee-examples_4.2.0.bb} (100%)
 rename meta-arm/recipes-security/optee/{optee-os-tadevkit_4.1.0.bb =3D> =
optee-os-tadevkit_4.2.0.bb} (100%)
 create mode 100644 meta-arm/recipes-security/optee/optee-os_4.2.0.bb
 rename meta-arm/recipes-security/optee/{optee-test_4.1.0.bb =3D> optee-t=
est_4.2.0.bb} (91%)

diff --git a/meta-arm-bsp/recipes-security/optee/optee-os/0003-optee-enab=
le-clang-support.patch b/meta-arm-bsp/recipes-security/optee/optee-os/000=
3-optee-enable-clang-support.patch
new file mode 100644
index 000000000000..3c13ce3f028c
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/optee/optee-os/0003-optee-enable-clan=
g-support.patch
@@ -0,0 +1,30 @@
+From 59d4c190eae11c93b26cca5a7b005a17dadc8248 Mon Sep 17 00:00:00 2001
+From: Brett Warren <brett.warren@arm.com>
+Date: Wed, 23 Sep 2020 09:27:34 +0100
+Subject: [PATCH] optee: enable clang support
+
+When compiling with clang, the LIBGCC_LOCATE_CFLAG variable used
+to provide a sysroot wasn't included, which results in not locating
+compiler-rt. This is mitigated by including the variable as ammended.
+
+Upstream-Status: Pending
+ChangeId: 8ba69a4b2eb8ebaa047cb266c9aa6c2c3da45701
+Signed-off-by: Brett Warren <brett.warren@arm.com>
+
+---
+ mk/clang.mk | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/mk/clang.mk b/mk/clang.mk
+index a045beee8..1ebe2f702 100644
+--- a/mk/clang.mk
++++ b/mk/clang.mk
+@@ -30,7 +30,7 @@ comp-cflags-warns-clang :=3D -Wno-language-extension-t=
oken \
+=20
+ # Note, use the compiler runtime library (libclang_rt.builtins.*.a) ins=
tead of
+ # libgcc for clang
+-libgcc$(sm)	:=3D $(shell $(CC$(sm)) $(CFLAGS$(arch-bits-$(sm))) \
++libgcc$(sm)	:=3D $(shell $(CC$(sm)) $(LIBGCC_LOCATE_CFLAGS) $(CFLAGS$(a=
rch-bits-$(sm))) \
+ 			-rtlib=3Dcompiler-rt -print-libgcc-file-name 2> /dev/null)
+=20
+ # Core ASLR relies on the executable being ready to run from its prefer=
red load
diff --git a/meta-arm/recipes-security/optee/optee-os_4.1.0.bb b/meta-arm=
-bsp/recipes-security/optee/optee-os_4.1.0.bb
similarity index 100%
rename from meta-arm/recipes-security/optee/optee-os_4.1.0.bb
rename to meta-arm-bsp/recipes-security/optee/optee-os_4.1.0.bb
diff --git a/meta-arm/recipes-security/optee/optee-client_4.1.0.bb b/meta=
-arm/recipes-security/optee/optee-client_4.2.0.bb
similarity index 71%
rename from meta-arm/recipes-security/optee/optee-client_4.1.0.bb
rename to meta-arm/recipes-security/optee/optee-client_4.2.0.bb
index 2f9567658262..56494e4cfe66 100644
--- a/meta-arm/recipes-security/optee/optee-client_4.1.0.bb
+++ b/meta-arm/recipes-security/optee/optee-client_4.2.0.bb
@@ -1,6 +1,6 @@
 require recipes-security/optee/optee-client.inc
=20
-SRCREV =3D "f7e4ced15d1fefd073bbfc484fe0e1f74afe96c2"
+SRCREV =3D "3eac340a781c00ccd61b151b0e9c22a8c6e9f9f0"
=20
 inherit pkgconfig
 DEPENDS +=3D "util-linux"
diff --git a/meta-arm/recipes-security/optee/optee-examples_4.1.0.bb b/me=
ta-arm/recipes-security/optee/optee-examples_4.2.0.bb
similarity index 100%
rename from meta-arm/recipes-security/optee/optee-examples_4.1.0.bb
rename to meta-arm/recipes-security/optee/optee-examples_4.2.0.bb
diff --git a/meta-arm/recipes-security/optee/optee-os-tadevkit_4.1.0.bb b=
/meta-arm/recipes-security/optee/optee-os-tadevkit_4.2.0.bb
similarity index 100%
rename from meta-arm/recipes-security/optee/optee-os-tadevkit_4.1.0.bb
rename to meta-arm/recipes-security/optee/optee-os-tadevkit_4.2.0.bb
diff --git a/meta-arm/recipes-security/optee/optee-os_4.2.0.bb b/meta-arm=
/recipes-security/optee/optee-os_4.2.0.bb
new file mode 100644
index 000000000000..8ae219f415a2
--- /dev/null
+++ b/meta-arm/recipes-security/optee/optee-os_4.2.0.bb
@@ -0,0 +1,10 @@
+require recipes-security/optee/optee-os.inc
+
+DEPENDS +=3D "dtc-native"
+
+FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}:"
+
+SRCREV =3D "12d7c4ee4642d2d761e39fbcf21a06fb77141dea"
+SRC_URI +=3D " \
+    file://0003-optee-enable-clang-support.patch \
+   "
diff --git a/meta-arm/recipes-security/optee/optee-test_4.1.0.bb b/meta-a=
rm/recipes-security/optee/optee-test_4.2.0.bb
similarity index 91%
rename from meta-arm/recipes-security/optee/optee-test_4.1.0.bb
rename to meta-arm/recipes-security/optee/optee-test_4.2.0.bb
index 1b124550b9d2..6317a72f0b1b 100644
--- a/meta-arm/recipes-security/optee/optee-test_4.1.0.bb
+++ b/meta-arm/recipes-security/optee/optee-test_4.2.0.bb
@@ -1,6 +1,6 @@
 require recipes-security/optee/optee-test.inc
=20
-SRCREV =3D "2e1e7a9c9d659585566a75fc8802f4758c42bcb2"
+SRCREV =3D "526d5bac1b65f907f67c05cd07beca72fbab88dd"
 SRC_URI +=3D "file://0001-xtest-stats-remove-unneeded-stat.h-include.pat=
ch"
=20
 # Include ffa_spmc test group if the SPMC test is enabled.
--=20
2.39.3 (Apple Git-146)


