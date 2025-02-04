Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38399C02194
	for <webhook@archiver.kernel.org>; Tue,  4 Feb 2025 14:17:38 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web11.117007.1738678653826570064
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 04 Feb 2025 06:17:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=RMd7UWs9;
 spf=pass (domain: linaro.org, ip: 209.85.167.52, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-53e3778bffdso5632029e87.0
        for <meta-arm@lists.yoctoproject.org>; Tue, 04 Feb 2025 06:17:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738678652; x=1739283452; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I4QbAcUJ+q5e/VOrgGXaOh499mh605gDl7BKqNAjjbs=;
        b=RMd7UWs9tPRkyywWjLAH9V8B4fk+K3iursM8UKDbMHw1sYilUUJkaFM9yYa0PxOAXN
         Ep27y1HAROAiECtZa8NmhlK0BGyFReza3mT2Wu4Zcp/cS+kwgYGjdyxJ+80/RGTc7c+V
         58usvZn9D29n1SfsPy0W+s3yj+QnBDMHR8CI6dOn59v6KKkLetIHRHZA8CxDU/aBLFeP
         yzZu/BpTvSo7mN6MT4IhHT55DNzBjO14yYhXlCYq3jUYnXtgkdomijSMG5tyZLPZFdA8
         vUaCkC8a2++Xope6m49Edwhf0b72t21TzLHLVPveqfvZf4cn149U2P8XnDWOCpoNUtGp
         gt5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738678652; x=1739283452;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I4QbAcUJ+q5e/VOrgGXaOh499mh605gDl7BKqNAjjbs=;
        b=MBTv5SPsey/0ylc6fH3EmYYrruWCcNsRar6FTLX+uoXi5wwA1cDjTln0mGzC4m2Qmr
         UbJ3VYDYcvcJPRxNa58kBog6wM8SsgqrZq2Jq7/Mq71OeMk+lwj2k4X0DY0d68BedZLw
         snvqBGa0tvEboqrOwU4ymhvOzleHqzTeXDF2FqFqj53ynti/PiEENoGb96LIuv6SzTjC
         IJ0cq6KbEAkyNiuUcRErWnJukRvdXvfWMendAqwOpDB+qqazRMA/l/u72P2Cmox1Func
         Ew2zg9I9E9tohiglJ7bSnLD4NS11BmjETzXd9civ8k/AtR1Es+Ju944e8klnxup8Fwea
         YzMw==
X-Forwarded-Encrypted: i=1; AJvYcCXXquFXew2EC6RbzlU7kVbmYnlcpHfh9qrLWWB+dB22k4UaJALxl3fMPlqdlD6MKv51mEjyrjeRSA==@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YwMlfIRON/WG33uEURDIDdVWmhW0BkYyHUTLL6IW7j7iscm1YUl
	1PyhVBjdqqb6+zGFuqeLNpr+ReJc5MInWJRAcVlW3EWM6mi7SDwCoPmTZXtUIkLuXqg6szMm1Tr
	E0KI=
X-Gm-Gg: ASbGncvhMPCFuPzo1QJrZgLrVFvqukAVUKBGVUypWSNR4qF6YVNUQxO75bObLWAv/HJ
	4LUjpxM3cYQuyd/qrRiU1fqr6OtKJNIjlk5FBCJvqXnWETEFX6opXrGoIudFxi00vZ/SRCGW1DG
	Ir5pz+YNlsfYZkDJ2n08jRgVwaFgSKFVugBB8nPmLaEtItBSgL5420kygCpjxvBWOQhahT7A5Ep
	jvEaywiR1LO06YCgCe2kaITY/HbyaSMaYhpkMBZVVxHrXlH941jY85QMmG20oXQfb8Q7X7chJFr
	kTz1/qV6RlYn2RHx5zmCvSKy+eXGLA/oLHm5JOFlwIYss7KNGS6c3+nTTRbs
X-Google-Smtp-Source: AGHT+IGISgDRcL2O0kWciZKjqxLTHlzpTklcGFutBdDps3Aklb8Sb6wLulYjZJcXUV6yltZQT2/WHQ==
X-Received: by 2002:ac2:4c56:0:b0:542:213f:7901 with SMTP id 2adb3069b0e04-543e4c3b982mr8471584e87.44.1738678651893;
        Tue, 04 Feb 2025 06:17:31 -0800 (PST)
Received: from localhost.localdomain (78-27-76-97.bb.dnainternet.fi. [78.27.76.97])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543ebebeda2sm1603211e87.247.2025.02.04.06.17.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 06:17:31 -0800 (PST)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>,
	Jon Mason <jdmason@kudzu.us>,
	meta-arm@lists.yoctoproject.org
Subject: [PATCH v3 3/3] systemd-boot-native: fix kernel signature for secureboot
Date: Tue,  4 Feb 2025 16:17:04 +0200
Message-ID: <20250204141705.1222153-3-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250204141705.1222153-1-mikko.rapeli@linaro.org>
References: <20250204141705.1222153-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 04 Feb 2025 14:17:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6365

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
index 5b4b63c294..967ac57fc5 100644
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


