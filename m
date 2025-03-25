Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCB4DC35FFC
	for <webhook@archiver.kernel.org>; Tue, 25 Mar 2025 11:06:51 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.web11.62719.1742900805225107091
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 25 Mar 2025 04:06:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=rQaSfULs;
 spf=pass (domain: linaro.org, ip: 209.85.208.180, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-30bfed67e08so62361881fa.2
        for <meta-arm@lists.yoctoproject.org>; Tue, 25 Mar 2025 04:06:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742900803; x=1743505603; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nmxmqJhDiOzj7NwnYAtRoOyv7EfkfTG+KTcagW+WRIY=;
        b=rQaSfULsYftxjSOzCOqAIYU8r+GbxcvKXxeEDDpeJXhL7Ich6Wa7yVtPNXiPmVUCEN
         C8szQbWzJYdW1eeZ84UHrGpvCXJOB+VCYcSmpo/kTAHK2XxKqyp/uBSBedngk6/M8/y0
         UF7NGfDVsYGHtowUatBvAVK4+JEmmcNkXDrT6QDz6710zYtRYWd2XRixBkpUX3H/rCXQ
         lNCds/4miMusj3x6w/1s4TPLrRbQ8yX33neGlUR76pK3Q0q4h+fmI+lnnUgjhfN//+NU
         32G6dxm0KT5SzQqAh6jagfF2rm9B+oFslUV7dU5X19C+C2ZqrR6USWjR9T+/FN+UBktx
         Y4nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742900803; x=1743505603;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nmxmqJhDiOzj7NwnYAtRoOyv7EfkfTG+KTcagW+WRIY=;
        b=YahZ+kfz/JuOT+oHl0PLIF6E3ujJBXikk8vBz7pdAawr96n+a6v2dVwK5B4p8VWD2P
         OuDBklylz2WuypO9wWU4O4kZX/DFg5mTt2PbyJjQnenAjjRrdV3KZi8NVEYVNVZ9gEpJ
         EE2wf8mpPWiff+4Mwdi2KmsVKQipT+iE9A3NqpdWHFu9myXBbxB8NqM51l2rp1vbgzcA
         EvVaLBpuRDjjJ8KDFr3WNhtklXCAAilUyl++DsmwAtWa8BdnfPlaE6NsGNe2g0nr7Fut
         30yP47WWKMU4ceO86VheOJnVPaeA99IiiQ/prLKrRKy7Ko3LhPK/Rnnjku3k1H/0lzv+
         V4ew==
X-Gm-Message-State: AOJu0YxhsY/Ao+eC0DRk27cHxhMQTYZdJr+ebysfxZZ+2GC7lwsr5NPq
	whQcnB7+/LJbbr/oATyAD1XjIB82Io1Q9HjLCOWqLRIeJsw2C1vr7u8TSyvy+rIraDM88M6vg/x
	9vCM=
X-Gm-Gg: ASbGncsfoRvxcvERE54vbCnqGF9DQRgvtGfYRbhB63NSCHxM41b2nhpBqeXNrveuYe7
	4Gt/4votm5rH7tLY4IXV0o/nr8fxBHjWMXcKlLrANxOZbIWMFPxtVZmfhACcA4Gbl9CKPpGJt5y
	56fc7KzzDpfHMWUkifPO46MNAhrGi0vi35rXQtRPU/iBrkSVzzqSc8YL9drYiOwKC+nNG3A9hZX
	ewIruAUuTbWCNtucpcTBxDkNQ2XkGi7hFeyHjRjTESD0g/SinEW+UoJgsbuzgKx7Z0anl7W906h
	jv88qsgJYdDHgpafm3UkPb+NdpAdzV6QRcsSdw4945q+B0eMAVCb3siI/W6mkgBKpMyE4FwPBu6
	QLqI+oKXHKpxqVIn7Mwdrgw==
X-Google-Smtp-Source: AGHT+IFOEEX/s2U7QEwcm0XMfsBrEZlS2/5eY+3pPtCWyqLP23lJ3eMnYruHWGQKsxSgFAkLGagH9Q==
X-Received: by 2002:a05:6512:3f28:b0:545:1db5:f224 with SMTP id 2adb3069b0e04-54ad6470a8amr6402373e87.11.1742900803299;
        Tue, 25 Mar 2025 04:06:43 -0700 (PDT)
Received: from localhost.localdomain (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ad64685easm1507309e87.12.2025.03.25.04.06.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Mar 2025 04:06:43 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH] trusted-firmware-a: move qemu patch
Date: Tue, 25 Mar 2025 13:06:30 +0200
Message-ID: <20250325110630.795963-1-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 25 Mar 2025 11:06:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6409

qemuarm64-secureboot directory in path to 0001-Add-spmc_manifest-for-qemu.patch
hides the patch from machines with different names and thus break builds
unless overrides are set to include "qemuarm64-secureboot".
Move patch to plain "files" directory to avoid build failures
and this cumbersome workaround.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 .../0001-Add-spmc_manifest-for-qemu.patch                         | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta-arm/recipes-bsp/trusted-firmware-a/files/{qemuarm64-secureboot => }/0001-Add-spmc_manifest-for-qemu.patch (100%)

diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/files/qemuarm64-secureboot/0001-Add-spmc_manifest-for-qemu.patch b/meta-arm/recipes-bsp/trusted-firmware-a/files/0001-Add-spmc_manifest-for-qemu.patch
similarity index 100%
rename from meta-arm/recipes-bsp/trusted-firmware-a/files/qemuarm64-secureboot/0001-Add-spmc_manifest-for-qemu.patch
rename to meta-arm/recipes-bsp/trusted-firmware-a/files/0001-Add-spmc_manifest-for-qemu.patch
-- 
2.43.0


