Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66D5EC27C5E
	for <webhook@archiver.kernel.org>; Tue,  4 Jun 2024 18:09:53 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.3052.1717524591754617513
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 04 Jun 2024 11:09:51 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 99EB91042
	for <meta-arm@lists.yoctoproject.org>; Tue,  4 Jun 2024 11:10:15 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 117AB3F762
	for <meta-arm@lists.yoctoproject.org>; Tue,  4 Jun 2024 11:09:51 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/6] arm/hafnium: update to v2.11
Date: Tue,  4 Jun 2024 14:09:45 -0400
Message-Id: <20240604180949.15501-2-jon.mason@arm.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20240604180949.15501-1-jon.mason@arm.com>
References: <20240604180949.15501-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 04 Jun 2024 18:09:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5786

Update hafnium to the latest version

Changes in hafnium between 946fde92bedc95e1320684b0bc2dc752bc1e1bc7 and 2=
bef7ab3895c48d39b84ab58179b2d0de5156b8b
2bef7ab3895c docs: the change log for the v2.11 release
2aea748eb344 docs: add SIMD support section
dac0ae1bf74a docs: threat model GPF with memory share
9dbe17a3fc60 docs: threat model to NWd rxtx buffer
0b45a2e28f65 docs: fix FFA_CONSOLE_LOG description
c28ee3eda25d docs: device regions in SPMC manifest
d547d6df4228 docs(memory management): rme integration
963a5d73abb5 docs: document `FFA_FEATURES`
d40979fd9974 docs: document `FFA_CONSOLE_LOG` ABI
dfc312e2a965 docs: add description of device memory lending
ce8526ecac0f docs: update threat model for static dma isolation
17c9ad327bfa fix(ff-a): report NPI and MEI unsupported to normal world
27a4df506d83 refactor(simd): cosmetic rename sm local variable
4695ce892967 fix(simd): fix SME-only save/restore conditions
4fd8f364ff43 fix(simd): omit setting SVE VL in SIMD restore
034a31970f4e fix(simd): cosmetic comments
79dbd6f9ab99 fix(simd): mask out SMCCC SVE hint bit
96ffeee3175b fix(simd): use SMCCC SVE hint bit mask
ca92fb0d303a refactor(simd): FPU save/restore convert to C
42a5262ebd4a fix: SVE/SME unsupported in processor feature regs
731f40b91e39 fix(test): reorder log before sync call in echo_mp
9b579d365a2d chore: remove extra lines from echo_mp test log
8a5fd9d9163a feat(indirect message): use 'memcpy_trapped'
0a21db13d12d feat(ff-a): use memcpy that is trapped GPF
a2d1c3b9c94a feat: add implementation of `memcpy_trapped`
7388c18ef222 refactor: exception handling macros for reuse at EL2
568f2a7b8fb9 feat(aarch64): define macros to process GPF
462ad8d90796 chore(hftest): use common secondary stack definition
491ff30f1ac4 test(dir_msg): demo MP test with direct message
0c029c2719cd feat: prepare for MP tests
b186fecfdf78 feat: added macro SERVICE_SELECT_MP
592ede3c7b95 test(memory share): NWd to SWd device memory sharing
63af1fab1656 feat(memory share): enable NWd to SWd device memory lending
4339edcf0bb0 feat(memory share): validate sp device mem ranges
6dff8271fbdc test(memory share): check limits on device mem sharing
a4de8a56b211 test(memory share): device lend SP to SP
a56ec8eff0f5 refactor(memory share): attributes in test helpers
9764ff6bd861 feat(memory share): allow device memory lend SP to SP
941ef34e5741 test(manifest): device memory for overlaps
4d16572b89ac feat(manifest): check device memory region for overlap
163e1a95a253 fix: ensure device regions are mapped as nGnRnE
899c4f28ab00 docs: drop unnecessary build option
03ba75fe13c3 refactor: set vcpu of the NWd in preempted state
0247fe68743e refactor: use `vcpu_set_running` function
874737a43d64 docs: mte build option in TF-A integration
2d570d1ef339 ci: increasing timeout
6976541fcc9e fix: update docs to use correct MTE build flag
b1dbca99bae7 docs: update docs with new RXTX_MAP/UNMAP behavior
738bee137e1d feat(ff-a): validate FFA_RXTX_MAP/UNMAP against NWd page tab=
les
41e8d5b1f805 refactor: set vcpu in preempted state
e143080baf9b feat: add `vm_lock_both_in_order`
587cd29b5d3a test: FFA_CONSOLE_LOG with extended registers
740f74fc95c6 feat: support extended register set for `FFA_CONSOLE_LOG`
b9705e2bd383 fix(ff-a): check that hypervisor's TX buffer is set-up
95f0e6033ad9 fix: fix typo in static_assert
f98b2aa1d407 feat: add helpers for names of various enums
84710f315ae7 refactor(ff-a): use bitfields for memory access bitmaps
2fc6dcfa97e0 feat: update BL31 binary to optimize NS context management
5386559b386a feat: save and restore non-secure peripheral registers
80a7b7fe9abe feat: save and restore non-secure MTE context
0ec38247a973 feat: save and restore non-secure system reg context
c70bacdd5054 refactor: create helpers to save and restore sys reg context
3956b2e6074a fix(direct message): tests to look for FFA_BUSY
7ea3f7ec8cb9 fix(direct message): reorder checks for FFA_BUSY
e5262378c5d7 fix(memory share): missing flag if permissions RO
c972cc6de311 fix(memory share): data access permissions
7de61af932d1 fix(memory share): sender and receiver are the same
f779fb7ed4eb fix: ffa_msg_wait shall not change the mailbox state
dc8cf3b899e6 test(ff-a): NPI not supported on EL0 partition
f1ed5f16cd59 fix(ff-a): report NPI unsupported on EL0 partition
76f1c8f03c27 test(ff-a): SRI is unsupported on secure world
cb6642c1cd6a fix(ff-a): report SRI unsupported to secure partitions
f7861301c512 test(ff-a): FFA_FEATURES returns max RXTX buffer size
0fd672906e61 feat(ff-a): report RXTX buffer size in FFA_FEATURES
f2b6fd1e8e7d test(ff-a): fix counts for ffa_info_get with multiple uuids
a1de3c5f69f6 feat(ff-a): add multiple uuids to partition info desc
3bbed8f554d2 fix: allow code coverage tests to run despite fails
6e3abcff0f1b docs: add FFA_MSG_SEND_DIRECT_REQ2/RESP2 support
364400e8d91b refactor: linux driver statically allocate vms
e0ca9a07de7b refactor(memory share): introduce ffa_memory_access_impdef_i=
nit
f1dd1e1375a8 fix: partition message total size check
37b75119ed18 fix: partition message offset check
0abd88768e9a test: FFA_MSG_SEND_DIRECT_RESP2 intercepted
4847e3bdd837 test(dir_msg): cyclic dependency with two ABIs
9375a292b992 test(smccc): test register integrity across FF-A versions
bed1dae8b4c1 test(dir_msg): extend multiple uuids test
f06b52366f40 fix(mem sharing): return error if receiver count is 0
5e425040abf4 test(memory share): multiple borrowers from v1.1 SP
a76fd9165b4b fix(memory share): broken assert in send from SP to multiple
d50411214cb8 docs: update memory sharing to reflect recent changes
607c724cbda3 chore: increase timeout for sp_route_interrupt_to_secondary_=
vcpu
106c8cec1662 fix: reduce verbosity on passing tf-a-tests
9ae48e998450 test: intercept direct response between two SPs
ca2f92d3adf1 test: enable specifying options for sp_fwd_sleep command
0a704e559d7e fix: unwind call chain after intercepting direct response
5a0991746afa fix: error return in FFA_MEM_PERM_GET/SET
f06ee9df186d fix(memory share): drop assertion sender ID
89c221317513 fix: per-vCPU/global bind/set mismatch
30ac91dc9c78 fix: global notifications shall use vCPU ID 0
6b754a188dca fix: flags that mbz are checked
f020814b4105 chore: improve log message in notification set
7333dcfaf21a fix: notification set error code
1512acc0a69c chore: print bitmap on FFA_NOTIFICATION_BIND
7ccaccf2ab18 fix: invalid ID in bitmap create/destroy
2a500071f224 fix: spmc test script didn't capture failures
37e559da0f07 refactor(tc): remap console logs
a3905006b590 test(dir_msg): add FF-A version based tests
382e0c622a79 test(ff-a): registers preserved after dir_resp
352388760d18 feat(ff-a): preserve extended registers in dir_resp
81237694db4d test: exercise interrupt handling while processing indirect =
message
8922671489d9 test: support for services to parse device regions
93978b038e4d test: add twdog helpers to primary_with_secondaries
9a1b9c0bff6b test: make sp805 driver common across test setups
ba2488560be8 fix(interrupts): intercept ffa_msg_wait to signal virtual in=
terrupt
ba22a72b8866 refactor: add helpers to intercept and resume ffa calls
7182163a2245 docs: update ff-a bindings for static dma isolation
555f8882f437 docs: add support for static dma isolation
7c7b1a7764ef feat: demonstrate specifying dma device count per partition
0715f32ba515 feat(smmuv3): restrict access of streams to limited memory r=
egions
0e57d3d35892 feat(iommu): map memory regions into dma page tables
070f49ebfb4a feat: initialize page tables for enforcing dma isolation
8a3644777dc1 feat: allow platforms to specify dma device count per partit=
ion
e032af5e6a37 feat: track dma devices and map to stream ids
3c2b7911e6ee feat: retrieve dma properties for each memory region node
1ced4cb719ff feat(sme): add NS SME save/restore operations
ffdeb23a067b feat(sme): introduce an SME module
52bbdee7487c feat(sme): add SME related definitions
5b5883351c94 feat(simd): SIMD NS save/restore convert to C
dc112d50c258 refactor: make is_arch_feat_sve_supported inlined
d71c83aa8f44 feat(sve): introduce an SVE module
b0faf45a6c4a fix: ensure SVE traps are enabled when running SPs
063ad835b5bd feat(memory share): revert protect action
fd2060536fee feat(memory share): unprotect memory on reclaim
460d36c1fc58 feat(memory share): protect on memory lend/donate
cf6253e3abec feat(memory share): protect/unprotect memory
a2ff04126675 feat(rme): add protect/unprotect memory functions
0a83dc2bf94c feat(memory share): define ffa_map_actions
dad6003e1fcd feat: add build options for memory protect
cb4dc90811b6 feat: arch helpers to check RME support
2e14ebe8b6e3 fix(memory share): fix behaviour of relinquish clear flag
3d0a462034c0 ci: separate static checks in a script
674e4de6bb3a refactor: mailbox doesn't need size and sender
44e9b3b7bebb fix(memory share): hypervisor retrieve request
7b6ab6195d84 fix(memory share): set size of access descriptor
4f0d9c1843cf refactor(memory share): split memory retrieve req
d61246b6c5e1 fix(ff-a): do not report FFA_EL3_INTR_HANDLE to VM
40d09d2ce60c docs: added section for building a single platform
f90f1f12de0a feat(build): check platforms exist before building
41ef8baba363 refactor(memory share): use receiver_offsets to find receive=
r array
39bc21b07309 test(dir_msg): test direct message abi pairs
e468c1168124 fix(dir_msg): enforce direct message ABI pairs
cf7cc68012d3 test(ff-a): add FF-A v1.2 ffa_features test
58fe07d70fea test(dir_msg): end-to-end direct msg test with multiple uuid=
s
422b10bc6991 feat(uuids): add support for multiple UUIDs per partition
036cc592731b test(ff-a v1.2): ffa_run to zero extended registers
434bea9652a1 test(dir_msg): add tests for FFA_MSG_SEND_DIRECT_REQ2
de0b0da535a1 test(dir_msg): extend registers in dir_msg tests
087e50241881 feat(dir_msg): add FFA_MSG_SEND_DIRECT_RESP2
db6a08b7cc6c feat(dir_msg) extend FFA_MSG_SEND_DIRECT_REQ2 registers
734ddc4e7cfb test(dir_msg) test FFA_MSG_SEND_DIRECT_REQ2
41fea93fe85b feat(dir msg): add FFA_MSG_SEND_DIRECT_REQ2
86d9fa741b86 feat(prebuilts): add SPMD support for ff-a v1.2 dir msg
c0e7dc20f2a9 docs: update messaging method ff-a binding
f71dee4c7bab feat(manifest): support FF-A v1.2 direct messages
9681574575c0 test(memory share): add test for FF-A v1.1 endpoints
63130e572dbe refactor(memory share): correct names of versioned share tes=
ts
909d3bbeca84 test(memory share): check memory access invalid values
59ffee9ba6bd test(memory share): introduce impdef value check
de974ca9b936 feat(memory share): add impdef field to ffa_memory_access
c7dc932e9a15 feat(memory share): check memory region desc values
d5ae44bed0c1 refactor(memory share): add helper for accessing receivers
36e0bdbf58e6 refactor(memory share): make ffa_memory_region update common
64400234fe31 refactor: make is_arch_feat_bti_supported inlined
109c6d4c0e5b fix: restrict HF_INTERRUPT_INJECT to Hypervisor
0926addea321 feat(amu): enable traps
0a1a9f861e6d feat(ff-a): update el0 services to v1.2
78788f863ca5 fix: ignore spurious interrupt and resume preempted vcpu
c5b20e7e0d6b chore: remove clang toolchain from prebuilts
6b351bc82c92 feat: build multiple targets at once
fdd59f75403f refactor: remove plat_ffa_other_world_mem_retrive function
ed7dee80b329 test: exercise interrupt handling with interrupts masked
3aafcb620cf4 test: add helpers and extend command args to mask interrupts
151c2e7f0bf3 fix(interrupts): intercept direct response to signal virtual=
 interrupt
09e086a7dbcf fix(interrupts): reset implicit completion signal
e1562a1488c3 feat(rd): secure hafnium build for rdfremontcfg1 platform
e4fe29698285 feat(ff-a): update FF-A version to v1.2
ad7451b1faee feat(prebuilts): update TF-A prebuilt binary to FF-A v1.2
ed508c80a039 chore: make function private to ffa_memory
b56aac880e08 fix: explicit boolean for `share_state` pointer
639ddfc0193e fix(memory share): read-only memory can't clear memory
41d4fef0f044 fix(memory share): error code in retrieve request
03f08d3dc4b8 feat(gicv3): ensure implementation supports two security sta=
tes

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../recipes-bsp/hafnium/{hafnium_2.10.bb =3D> hafnium_2.11.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-arm/recipes-bsp/hafnium/{hafnium_2.10.bb =3D> hafnium_2.11.b=
b} (97%)

diff --git a/meta-arm/recipes-bsp/hafnium/hafnium_2.10.bb b/meta-arm/reci=
pes-bsp/hafnium/hafnium_2.11.bb
similarity index 97%
rename from meta-arm/recipes-bsp/hafnium/hafnium_2.10.bb
rename to meta-arm/recipes-bsp/hafnium/hafnium_2.11.bb
index dea1bdcbb789..0fe9a79b032f 100644
--- a/meta-arm/recipes-bsp/hafnium/hafnium_2.10.bb
+++ b/meta-arm/recipes-bsp/hafnium/hafnium_2.11.bb
@@ -18,7 +18,7 @@ SRC_URI =3D "gitsm://git.trustedfirmware.org/hafnium/ha=
fnium.git;protocol=3Dhttps;br
            file://0001-Use-pkg-config-native-to-find-the-libssl-headers.=
patch;patchdir=3Dthird_party/linux \
            file://0001-work-around-visibility-issue.patch;patchdir=3Dthi=
rd_party/dtc \
           "
-SRCREV =3D "946fde92bedc95e1320684b0bc2dc752bc1e1bc7"
+SRCREV =3D "2bef7ab3895c48d39b84ab58179b2d0de5156b8b"
 S =3D "${WORKDIR}/git"
 B =3D "${WORKDIR}/build"
=20
--=20
2.39.3 (Apple Git-146)


