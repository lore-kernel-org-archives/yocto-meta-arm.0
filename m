Return-Path: <javier.tia@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95EEFC49EA1
	for <webhook@archiver.kernel.org>; Thu, 18 Jul 2024 20:35:59 +0000 (UTC)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
 by mx.groups.io with SMTP id smtpd.web11.4164.1721334958497486417
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 18 Jul 2024 13:35:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=f3KX/iaP;
 spf=pass (domain: linaro.org, ip: 209.85.128.172, mailfrom: javier.tia@linaro.org)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-65fdfd7b3deso13201297b3.0
        for <meta-arm@lists.yoctoproject.org>; Thu, 18 Jul 2024 13:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721334957; x=1721939757; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jDGqvjEL+9UIxamUQxP5sgH5iddm+9P5Jr141AAsmsw=;
        b=f3KX/iaPdTjSJ4OkYcDFJB7thyc9Db3xXZD/Rkrpw9ilHF9ZuKQ33nCHk5nHI4i6y+
         kY20G06ziFjMALvbegPeQTSEOsBileJtXFwEgitUlLVd/HmUzWtw31Kqer2/RccRF2gm
         lZRATqEo195Ty6Hg2cJsZGiqfL8osfBxFoX9CcjevdBXAnZu+/Y8Ptmo06SbOjQOMwMp
         9CudC0Ga7Q18OYSUHmslECppMeO+Wid5XNAnP6zVYcy/2DuUVb7hqYQtxsNJJXR43OHf
         0MEm99GHzextQE9fAFHnnUU4Egswzrl4twzw/R6rCDzKreXDl7IyVCdqr2ryoo/mpTE8
         5JkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721334957; x=1721939757;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jDGqvjEL+9UIxamUQxP5sgH5iddm+9P5Jr141AAsmsw=;
        b=XLuFtDpjIp8oixxrZ82Asq2452i49I1nRzqG0v6+1/ZWj+0xlbqzKVtesv1Ul2LtOn
         ckP8MuaDuESxEAMnIzPnnNJ7In0jrJrVdE8MY8fKCLKqrMVSoQYZ8FVO3uDtKLnjlzUm
         RMYM0DQeP7zrdY12KSqVRX5/gI48GLVWvmyYlyc65Rat+3OOY7hY+2lKgKwKGkXnmDvq
         zKeXs51j0MgNES7wazNfZyB6j2pY0WJc/vO8K5jY8Z6KEM1GB/Jem23mDzJEeWSpDGxy
         5xJCOcPuT4HgCYrWOQVLttQczOL6BXUy9q5yKIO+DwP1yg/ww3Ci/qkxwMuJI4k+lSuc
         B4zg==
X-Gm-Message-State: AOJu0YyVkdfsO08O+VVw5meT6alfq1gUkmAu7miowEOMwx31tNW0HOQS
	epQbOty+8kjmz1ZDDB8QdGuAhNaM0nqYFpxZBjZQ4N/AcjpMRfZmpsFAgBeTK/BYVzzm76kdtDO
	nkSA=
X-Google-Smtp-Source: AGHT+IGkSNCTn4NDg2jmtCBO/0+NlCNWxChXvKovCY/3FggdhFQkT6yzwmaGvJTh1Y3UCIpdccPPfQ==
X-Received: by 2002:a05:690c:e0e:b0:65f:9b24:7883 with SMTP id 00721157ae682-664fde7fdbcmr82993017b3.1.1721334957460;
        Thu, 18 Jul 2024 13:35:57 -0700 (PDT)
Received: from localhost.localdomain ([190.171.102.111])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6695245a1dasm171657b3.53.2024.07.18.13.35.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jul 2024 13:35:57 -0700 (PDT)
From: Javier Tia <javier.tia@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>,
	Ross Burton <Ross.Burton@arm.com>,
	Javier Tia <javier.tia@linaro.org>
Subject: [PATCH v1 7/7] qemuarm64-secureboot: Add UEFI systemd support
Date: Thu, 18 Jul 2024 14:35:26 -0600
Message-ID: <20240718203526.52214-8-javier.tia@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240718203526.52214-1-javier.tia@linaro.org>
References: <20240718203526.52214-1-javier.tia@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 18 Jul 2024 20:35:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5906

Signed-off-by: Javier Tia <javier.tia@linaro.org>
---
 meta-arm/recipes-core/systemd/systemd-uefi-secureboot.inc | 1 +
 meta-arm/recipes-core/systemd/systemd_%.bbappend          | 1 +
 2 files changed, 2 insertions(+)
 create mode 100644 meta-arm/recipes-core/systemd/systemd-uefi-secureboot.inc
 create mode 100644 meta-arm/recipes-core/systemd/systemd_%.bbappend

diff --git a/meta-arm/recipes-core/systemd/systemd-uefi-secureboot.inc b/meta-arm/recipes-core/systemd/systemd-uefi-secureboot.inc
new file mode 100644
index 00000000..5572e51a
--- /dev/null
+++ b/meta-arm/recipes-core/systemd/systemd-uefi-secureboot.inc
@@ -0,0 +1 @@
+PACKAGECONFIG:append = " efi"
diff --git a/meta-arm/recipes-core/systemd/systemd_%.bbappend b/meta-arm/recipes-core/systemd/systemd_%.bbappend
new file mode 100644
index 00000000..577c4f0c
--- /dev/null
+++ b/meta-arm/recipes-core/systemd/systemd_%.bbappend
@@ -0,0 +1 @@
+require ${@bb.utils.contains('MACHINE_FEATURES', 'uefi-secureboot', 'systemd-uefi-secureboot.inc', '', d)}
-- 
2.45.2


