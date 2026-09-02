Return-Path: <floss@jetm.me>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2A77C624D4
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 22:26:55 +0000 (UTC)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7589.1788388010693754870
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 02 Sep 2026 15:26:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@peridio.com header.s=google header.b=zf2uIBl8;
 spf=pass (domain: peridio.com, ip: 209.85.217.44, mailfrom: javier@peridio.com)
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-7841735b805so139742137.0
        for <meta-arm@lists.yoctoproject.org>; Wed, 02 Sep 2026 15:26:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=peridio.com; s=google; t=1788388009; x=1788992809; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FeelcWGOyhbJO9pbhSgJ2kSB0WaxbQSQLqf+PkOO1sE=;
        b=zf2uIBl8Gn5z7ovcqfD+GPgql5Or8eejaytCnS/cIaPX10am3mqqfd++kk+g2iTOLU
         yFUZxyHXvypepbRLkVt0ciavvND+S/8QQ8xDyPXIaB6Il645vOHwMV/Hc1GEwfJ5ryi6
         qYRu3EmlzoEaxuOrfkm0WooRox6uHIpemmRjPLEOiwpeg6sC7RHZiVkum+TEBxqLW8pW
         56JoZ0ePYaNAPOdcKdY4/EaoGIfIAXUWuO9nG0MjULljTB+PHxCPSeunkphFFCN8uP0j
         xFI3XTFy5z+AKrtGjmvajQUBgNsR6ShGVbINzbhJEgMmEeZmYfSQ0eIo0T/jy128DE4q
         ZTsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788388009; x=1788992809;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FeelcWGOyhbJO9pbhSgJ2kSB0WaxbQSQLqf+PkOO1sE=;
        b=NoTDATL2Nr7uI74oYv0NVOkVe/BJrWvUL/Tihj4leY26NpNbARcYjwoaoq2II3uRUF
         5kleq217vCntHbi9HYyU/eEB+4mXDLupAQZuoEQJEFTT3gy9ezhChxsIe/+l8gCN8h23
         V5truc0X5u22v/R1Pa2R6Nf80sDej3WSDcKdqa8JSuzC3jOx3MZQ3kUwG1l45FT9bf1e
         XYXgGwJS++6EJRlrPcL+Tkh2qMZdPGpcCJDWbYG+WoQIO5pPD8a9TfxUEn7i9Xu8KnNU
         k3lYh4ZxwB0rBt0YNmcjvaAftKJP3VTEfQeKjffEyRE/BlgFKhHrBBrgTvBuIwKCg4FU
         5I1A==
X-Gm-Message-State: AFuF++kiiGal8AgLneAcW73uTF1m95/OHHc8xGeHxsU2Lh5nqHCrOMTM
	ZfcoAdv/PAJvenXqzAo/vNMfnHM2TxX/ib4aCH2uTJbRzgkGJLkZAlLB6MFz/6sKRQwyKBLrg8k
	BIqR5A0U=
X-Gm-Gg: AYBFou389BEFMs0Zt7Q8vEC7xdo8qqi2Ii5qtdIX9OQF1jg3vkjlgbgxqiawQW0S8il
	QdHRiec+bi4ZpHF0jTaztdhuikcc/Xdn3lhzn0w2qKYxpOftj6LXlWRYNAK3EIhE7EnlBayKzpA
	5HTZddTBNEqUQzLdjDZTe8KbPrzGtZXefiQ+dgthRviUeOUXueW+JAcO9rIxFPI4H/j4EO6Zji/
	mzURD/O5mRfiJLKh01wp0HyFQYwvQjRU0Zusf2n8XrZSRUxW4ir6KLlcaX+IR/NwHatlMC9cObX
	RYZzaIRCbYmONDitZwzVqTgg6gwnOqBJAfHUwHusHLQXqpKJCLWgIuMeHYlBeFylun5uGwp/ahj
	yc+bQsXBUdMabopczq7/WMis0sHqWwxFKbZ0pQhZvQi4JfsqS4OSMj4pAtw5iYMZ9LjMyYH+e3D
	If+GTThukzvyTPav3XcsBcFTdvIARkSWwfGjzPEPCPIgHqk9RG0Nt4G7kC4Jwlnhzr4ZbN
X-Received: by 2002:a05:6102:14a5:b0:786:c254:b7f6 with SMTP id ada2fe7eead31-78a1eefb2dfmr1349808137.0.1788388009449;
        Wed, 02 Sep 2026 15:26:49 -0700 (PDT)
Received: from localhost ([190.113.101.40])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-98067404077sm3228041241.13.2026.09.02.15.26.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 15:26:49 -0700 (PDT)
From: Javier Tia <javier@peridio.com>
To: meta-arm@lists.yoctoproject.org
Cc: Jon Mason <jon.mason@arm.com>,
	Javier Tia <javier@peridio.com>
Subject: [wrynose PATCH 1/4] arm/optee: modify CVE_PRODUCT
Date: Wed,  2 Sep 2026 16:26:43 -0600
Message-ID: <20260902222646.2945592-2-javier@peridio.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902222646.2945592-1-javier@peridio.com>
References: <20260902222646.2945592-1-javier@peridio.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 02 Sep 2026 22:26:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7153

From: Jon Mason <jon.mason@arm.com>

Per https://nvd.nist.gov/products/cpe/detail/EB42962B-24FD-4716-B3E2-69F3258A57CF
adding "trustedfirmware:op-tee"

We can probably remove "linaro:op-tee", since it has been depreciated.
Fearing unintended issues, leaving it in for now.

Signed-off-by: Jon Mason <jon.mason@arm.com>
(cherry picked from commit 81f5a92193d37027670f2c9b767ccbcd29d1e78c)
Signed-off-by: Javier Tia <javier@peridio.com>
---
 meta-arm/recipes-security/optee/optee-os.inc | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-arm/recipes-security/optee/optee-os.inc b/meta-arm/recipes-security/optee/optee-os.inc
index 076e482b..95c41fb1 100644
--- a/meta-arm/recipes-security/optee/optee-os.inc
+++ b/meta-arm/recipes-security/optee/optee-os.inc
@@ -8,7 +8,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c1f21c4f72f372ef38a5a4aee55ec173"
 inherit deploy python3native
 require optee.inc
 
-CVE_PRODUCT = "linaro:op-tee op-tee:op-tee_os"
+CVE_PRODUCT = "linaro:op-tee \
+               op-tee:op-tee_os \
+               trustedfirmware:op-tee"
 
 DEPENDS = "python3-pyelftools-native python3-cryptography-native"
 
-- 
Javier Tia


