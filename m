Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39451C0219C
	for <webhook@archiver.kernel.org>; Thu,  6 Feb 2025 07:30:43 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web11.34701.1738827036017544418
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 05 Feb 2025 23:30:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=en7zLOiM;
 spf=pass (domain: linaro.org, ip: 209.85.167.45, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5401bd6cdb4so693811e87.2
        for <meta-arm@lists.yoctoproject.org>; Wed, 05 Feb 2025 23:30:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738827034; x=1739431834; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=osNtNUbLr/o3petIfsdXoyxZeqRQ7bYGlt8wqMetFE0=;
        b=en7zLOiMZ03KpDJswAM2nwPktvM82ngjHsY3fBLO1MbEAsnBJ0CHpsbtIASGjVTTFr
         eUWyymgJha61A1qe+oRj2B0o9248BH/emC6aU2ugs1+wXUZC3Iuw7t/KoXCNPz6Df4ml
         8RyM5DgYnt8Cab1X5886LsCd99c4c8WJo6YA+MmX8fxMtCRIcAtNpqb6ktVSTUfZLduI
         7YI57DLg/szydbMV8DQHQ3ZRaM42hJ96XQ1oG3Yqp58JYn1GPWZzNSvAgNdLd207DO5V
         XDFtVZV+vP8YA3aCdpCcaLu6M2Ew3BqtQA6DxohkhQCs64LY2p9kZX+dd1L2bdVxeTdo
         pmlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738827034; x=1739431834;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=osNtNUbLr/o3petIfsdXoyxZeqRQ7bYGlt8wqMetFE0=;
        b=AYf/cTFtn8iGa4xSSdzM/GNq47a3dkFszRODbcollHhbkD3Fq4nkV1/uALMcTccWH3
         sy861t6D/8LxvfaU9ZwUv052RwyZOHpawGNlrDxhxjAxoj0yzM4qBDGcDaWkfZcdx0Gh
         5kDMgGNfgGBXLB/EMTPMoHlFGvsxunnBT2E2K0e2KjXHINvU8sfH9ktj4pipquClQrNk
         +tKqOwueCaz7cYEZqi/XX0fhaowdF3pJkYb7WYdRHawNay3cuGSjvtNut912RDzU5xbb
         jBPDYj15nE2HOguRl7Xi/FmYuCwXfk5dp+Hcu0aLVjybnykoP4d9wgDe14PBXdli66+0
         pQ5w==
X-Forwarded-Encrypted: i=1; AJvYcCWuyHt/eaYiPbgBqnsfZm9Ji/y1uLKWr1P8862OioygsDwjJ85bbPQYZymKvzqitlxJHSlvULEEeQ==@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YxiP5ZYWwD4JcjOz31DuvFIiWPL0kuLzCFePgw/4/bIZlHURWcZ
	XK9fC8EFG73AawKQW9VddZ2S0SQSWbrKlyK1H1daFmktdyPCFzCmhUvEzFVIUJQ=
X-Gm-Gg: ASbGnct/tcBlCLfR9Qrt87HEB6E42IkwbYV4ZDm1O0ubTsi9RjvgsyV0D1xk+2CIT3z
	CvfOXfpTEb2+DGQFcCX6NrnVdQUfyvHZ3alcmiiz1qYd1nFk/BL8lk0yXo49I9q4LB9JmOYQx+L
	QLKhfDo9BbevZ8GyZ4wDkqEvmHL954GyVPrAaPkUl/+6vLqe58TLjr1GoqkpO8ilgp3un90+qNN
	hZghZqpHJrShbekiEgjBYYJrDUGlgWlPC1txqR0la+f8gsmfP3/foZH1fVCXPrX/OGokjes3gta
	IVZadPMCPLZvtkoJvEHOzHWlSdkdlbjU/cp5pmZqPtUsHgCpPuQswj0d5Wnp
X-Google-Smtp-Source: AGHT+IHZ98qyMc5rkpKTY8Nh9qGe1ONvZijJwHvl5U03Csefc2z+mv+P0Umd+twW4gyyjyn1P3Qgmg==
X-Received: by 2002:a05:6512:238d:b0:542:2486:697b with SMTP id 2adb3069b0e04-544059fc788mr1915536e87.10.1738827034020;
        Wed, 05 Feb 2025 23:30:34 -0800 (PST)
Received: from localhost.localdomain (78-27-76-97.bb.dnainternet.fi. [78.27.76.97])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-307de1a67c9sm654781fa.48.2025.02.05.23.30.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 23:30:32 -0800 (PST)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>,
	Jon Mason <jdmason@kudzu.us>,
	meta-arm@lists.yoctoproject.org
Subject: [PATCH v4 3/3] systemd-boot-native: fix kernel signature for secureboot
Date: Thu,  6 Feb 2025 09:30:13 +0200
Message-ID: <20250206073013.1280187-3-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250206073013.1280187-1-mikko.rapeli@linaro.org>
References: <20250206073013.1280187-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 06 Feb 2025 07:30:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6368

systemd update from 256 to 257 broke kernel secureboot signatures
inside signed UKI files with u-boot based UEFI firmware, e.g.
meta-arm and qemuarm64-secureboot machine config and secureboot:

$ cd meta-arm
$ kas build ci/poky.yml:ci/qemuarm64-secureboot.yml:ci/uefi-secureboot.yml:ci/testimage.yml

systemd-boot itself is secureboot signed and verified by firmware.
Same for the UKI file which combines kernel, initramfs etc.
Then kernel from UKI is additionally executed using UEFI firmware calls
which check signatures so the kernel binary inside signed UKI
needs to be signed with same keys too. PE file padding added
to systemd ukify in 257 release broke kernel signature validation
for u-boot and sbsign/sbverify tools. EDK2 based firmware like
OVMF may not be affected because systemd-boot is able to disable
signature checking after a signed UKI has been loaded. This feature
is not supported by u-boot.

Upstream systemd bug report:

https://github.com/systemd/systemd/issues/35851

Backport of:

https://github.com/systemd/systemd/commit/38801c91292fde004bec0974ed5602984701e03b

Cc: Jon Mason <jdmason@kudzu.us>
Cc: meta-arm@lists.yoctoproject.org
Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 .../systemd/systemd-boot-native_257.1.bb      |   3 +
 ...vert-changes-to-use-SizeOfImage-from.patch | 122 ++++++++++++++++++
 2 files changed, 125 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-ukify-measure-Revert-changes-to-use-SizeOfImage-from.patch

diff --git a/meta/recipes-core/systemd/systemd-boot-native_257.1.bb b/meta/recipes-core/systemd/systemd-boot-native_257.1.bb
index 7b60d6b583..15db156d4f 100644
--- a/meta/recipes-core/systemd/systemd-boot-native_257.1.bb
+++ b/meta/recipes-core/systemd/systemd-boot-native_257.1.bb
@@ -1,4 +1,7 @@
 require systemd.inc
+FILESEXTRAPATHS =. "${FILE_DIRNAME}/systemd:"
+
+SRC_URI += "file://0001-ukify-measure-Revert-changes-to-use-SizeOfImage-from.patch"
 
 inherit native
 
diff --git a/meta/recipes-core/systemd/systemd/0001-ukify-measure-Revert-changes-to-use-SizeOfImage-from.patch b/meta/recipes-core/systemd/systemd/0001-ukify-measure-Revert-changes-to-use-SizeOfImage-from.patch
new file mode 100644
index 0000000000..3be56cb9c0
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0001-ukify-measure-Revert-changes-to-use-SizeOfImage-from.patch
@@ -0,0 +1,122 @@
+From 60d76dce7b013406412bc9720dbf05fb558ea099 Mon Sep 17 00:00:00 2001
+From: Daan De Meyer <daan.j.demeyer@gmail.com>
+Date: Tue, 4 Feb 2025 09:24:26 +0100
+Subject: [PATCH] ukify/measure: Revert changes to use SizeOfImage from Linux
+ PE binary
+
+With 19812661f1f65ebe777d1626b5abf6475faababc, we make sure at runtime
+in the stub itself that SizeOfImage from the Linux EFISTUB PE binary is
+taken into account, so there's no need to take this into account in ukify
+itself. By reverting the ukify change, we again ensure that Misc_VirtualSize
+reflects the actual size of the Linux EFISTUB PE binary in the .linux section
+which lots of tooling depends on. It also makes sure we don't measure a bunch
+of extra zeroes in the stub which should fix systemd-pcrlock measurements as
+well.
+
+This effectively reverts 2188c759f97e40b97ebe3e94e82239f36b525b10 and
+0005411352f9bda0d9887c37b9e75a2bce6c1133.
+
+Fixes #35851
+---
+ src/measure/measure.c | 32 --------------------------------
+ src/ukify/ukify.py    | 16 ++--------------
+ 2 files changed, 2 insertions(+), 46 deletions(-)
+
+Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
+
+Upstream-Status: Backport [https://github.com/systemd/systemd/commit/38801c91292fde004bec0974ed5602984701e03b]
+
+diff --git a/src/measure/measure.c b/src/measure/measure.c
+index e583444e0bf..2057ce2a0e6 100644
+--- a/src/measure/measure.c
++++ b/src/measure/measure.c
+@@ -544,38 +544,6 @@ static int measure_kernel(PcrState *pcr_states, size_t n) {
+                         m += sz;
+                 }
+ 
+-                if (c == UNIFIED_SECTION_LINUX) {
+-                        _cleanup_free_ PeHeader *pe_header = NULL;
+-
+-                        r = pe_load_headers(fd, /*ret_dos_header=*/ NULL, &pe_header);
+-                        if (r < 0)
+-                                log_warning_errno(r, "Failed to parse kernel image file '%s', ignoring: %m", arg_sections[c]);
+-                        else if (m < pe_header->optional.SizeOfImage) {
+-                                memzero(buffer, BUFFER_SIZE);
+-
+-                                /* Our EFI stub measures VirtualSize bytes of the .linux section into PCR 11.
+-                                 * Notably, VirtualSize can be larger than the section's size on disk. In
+-                                 * that case the extra space is initialized with zeros, so the stub ends up
+-                                 * measuring a bunch of zeros. To accommodate this, we have to measure the
+-                                 * same number of zeros here. We opt to measure extra zeros here instead of
+-                                 * modifying the stub to only measure the number of bytes on disk as we want
+-                                 * newer ukify + systemd-measure to work with older versions of the stub and
+-                                 * as of 6.12 the kernel image's VirtualSize won't be larger than its size on
+-                                 * disk anymore (see https://github.com/systemd/systemd/issues/34578#issuecomment-2382459515).
+-                                 */
+-
+-                                while (m < pe_header->optional.SizeOfImage) {
+-                                        uint64_t sz = MIN(BUFFER_SIZE, pe_header->optional.SizeOfImage - m);
+-
+-                                        for (size_t i = 0; i < n; i++)
+-                                                if (EVP_DigestUpdate(mdctx[i], buffer, sz) != 1)
+-                                                        return log_error_errno(SYNTHETIC_ERRNO(EINVAL), "Failed to run digest.");
+-
+-                                        m += sz;
+-                                }
+-                        }
+-                }
+-
+                 fd = safe_close(fd);
+ 
+                 if (m == 0) /* We skip over empty files, the stub does so too */
+diff --git a/src/ukify/ukify.py b/src/ukify/ukify.py
+index 3f36aa7af6b..08e7622c499 100755
+--- a/src/ukify/ukify.py
++++ b/src/ukify/ukify.py
+@@ -388,7 +388,6 @@ class Section:
+     tmpfile: Optional[IO[Any]] = None
+     measure: bool = False
+     output_mode: Optional[str] = None
+-    virtual_size: Optional[int] = None
+ 
+     @classmethod
+     def create(cls, name: str, contents: Union[str, bytes, Path, None], **kwargs: Any) -> 'Section':
+@@ -918,10 +917,7 @@ def pe_add_sections(uki: UKI, output: str) -> None:
+ 
+         new_section.set_file_offset(offset)
+         new_section.Name = section.name.encode()
+-        if section.virtual_size is not None:
+-            new_section.Misc_VirtualSize = section.virtual_size
+-        else:
+-            new_section.Misc_VirtualSize = len(data)
++        new_section.Misc_VirtualSize = len(data)
+         # Non-stripped stubs might still have an unaligned symbol table at the end, making their size
+         # unaligned, so we make sure to explicitly pad the pointer to new sections to an aligned offset.
+         new_section.PointerToRawData = round_up(len(pe.__data__), pe.OPTIONAL_HEADER.FileAlignment)
+@@ -1166,6 +1162,7 @@ def make_uki(opts: UkifyConfig) -> None:
+         ('.uname',   opts.uname,      True),
+         ('.splash',  opts.splash,     True),
+         ('.pcrpkey', pcrpkey,         True),
++        ('.linux',   linux,           True),
+         ('.initrd',  initrd,          True),
+         ('.ucode',   opts.microcode,  True),
+     ]  # fmt: skip
+@@ -1182,15 +1179,6 @@ def make_uki(opts: UkifyConfig) -> None:
+     for section in opts.sections:
+         uki.add_section(section)
+ 
+-    if linux is not None:
+-        try:
+-            virtual_size = pefile.PE(linux, fast_load=True).OPTIONAL_HEADER.SizeOfImage
+-        except pefile.PEFormatError:
+-            print(f'{linux} is not a valid PE file, not using SizeOfImage.')
+-            virtual_size = None
+-
+-        uki.add_section(Section.create('.linux', linux, measure=True, virtual_size=virtual_size))
+-
+     # Don't add a sbat section to profile PE binaries.
+     if opts.join_profiles or not opts.profile:
+         if linux is not None:
+-- 
+2.43.0
+
-- 
2.43.0


