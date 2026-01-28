Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64B72D3F06B
	for <webhook@archiver.kernel.org>; Wed, 28 Jan 2026 14:13:33 +0000 (UTC)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14179.1769609612567083210
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 28 Jan 2026 06:13:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=Z5m6dVgd;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.173, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-5028fb9d03bso59175211cf.3
        for <meta-arm@lists.yoctoproject.org>; Wed, 28 Jan 2026 06:13:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1769609611; x=1770214411; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=406maLpC3CRTWM/xhG91hU6t22kgQgnT2Z6VvkJHWAQ=;
        b=Z5m6dVgdWwPljSs+KU+ZPLqPCOngs3ts5/b0snWgzektexz+HLzzYH877NjyCCtdpz
         gYlraIKKakVrFyO9Afu+TDMt66Fi/zVMOJPaQfxCZpSj8c78DKrn0Za/gLbLfmJRKrls
         Xg6qkzVg9jUiqFu5z/iazrIDF3HKV+RwKVM78c5r7SxXnkmDweWdvKQVzlK9VNbmKLMo
         Ynd4nxiltuFk1dgxltIIm3VaU8lGp86aLW84TasSA5O1IBEuYKBXPSvFPKgb18gZVi15
         bzYTrdnoUaxGWI7pakaWqIo5IMeGQ0qhKASo5RcGjxg4aWbHncNXG2b1dAGNmaTfgqA8
         pdOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769609611; x=1770214411;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=406maLpC3CRTWM/xhG91hU6t22kgQgnT2Z6VvkJHWAQ=;
        b=vh9x0QLLcPPfi9IIHhJAN9D1oO5HyYkjS2PIwTEFKtle79Id+tI6bwDXOjAT9Erp3j
         mISl62w70dNCSTaEyGscbS6+xYVPmdZ1HGA6n5UOe15VAFCvoBCpFfJE95lgKN2Qr4YC
         6nKlJkeMROitp0Q1VWcNMTL5sk69Ae6q5f4EkC7dqmY9XdXMD8vl5Qdu6O64ths7JvB4
         1AsXWlHZigkJ5iWVG4J+4xm7LVSKRHBW4cYjFZ4g9SiOj9U6l2o+Yn2TIk2avR1Cbvj0
         f8ul4tvj/JJwBN1lwiOGFKuq7tYlNxoe4x+ope6EVEo9DO6ggXe6xMt1TLseDQmLYvA4
         kb9g==
X-Gm-Message-State: AOJu0YwUdBtN989HRH8QLEE+MR49EiVGjB5iFo+ieYbfSz7M+1XdhPjt
	IV17oQJU1BcLRjiGNHHUMgT49gxrvOD+i/3/3cSchcZTCBYR2FOAsaYz3vHtTxxR7eXEsjzuj3V
	clQU=
X-Gm-Gg: AZuq6aKa0twAuHI28PXHmBrpK1QWhjxnDDcGQoh8VZDmtnwdXCDlkwtvnu6pL8rPgoM
	ppqxMcxrGxfHKVF8nxcUXXXfLh84g63glSvVVD3O+4fWeOl/Xyg5+bnLgM0+s4nYYMF2BG6oiVy
	Iy5S8O276wNUifEXxWXK1imKH9LhTQswU0mCFCd0qYIWJZ0hul3EsW64EyjvRN+60UNJWG3udt7
	N7zKLxJewY26el+rrfO6jCBf2bN6YR4rlcFVNcBpL1MEbkatdQChHrquU+Hr41PVk/8X4IPVtUs
	2YhgUo9+5K8FlIGE9dI5jb5Fz9VG6okrZ7pFkzF1lhs7hji9p7CF4kVvrfvsiYGkF6ba6Stez+v
	p4pcXqEEtl7RAhNl5jdoqw9ZDOcM0/0cxOhuBCxMObYA+wwbXj4L/bRp5SKx89ttd4wu4y6pKJh
	HR
X-Received: by 2002:a05:622a:8f:b0:4ed:66bd:95ea with SMTP id d75a77b69052e-5032f898ad5mr66181641cf.29.1769609610796;
        Wed, 28 Jan 2026 06:13:30 -0800 (PST)
Received: from localhost ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c711d47f92sm187145185a.42.2026.01.28.06.13.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 06:13:30 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
Subject: Re: [PATCH v3 0/3] arm/arm-bsp: optee: upgrade to 4.9.0
Date: Wed, 28 Jan 2026 09:13:15 -0500
Message-Id: <176960959750.4138450.5924072647744468627.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260127154532.27572-1-hugues.kambampiana@arm.com>
References: <20260127154532.27572-1-hugues.kambampiana@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 28 Jan 2026 14:13:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6883


On Tue, 27 Jan 2026 15:45:22 +0000, Hugues KAMBA MPIANA wrote:
> Move SRC_URI branch/tag selection to optee.inc so
> release recipes fetch tags (with nobranch=1) and
> _git recipes keep branch=master. Update optee-os,
> optee-test, and optee-examples to use the shared
> selector and remove the optee-test override. Also
> switch optee-ftpm’s optee-ta source to a tag-based
> fetch for reproducible builds.
> 
> [...]

Applied, thanks!

[1/3] arm/arm-bsp: optee: add version 4.9.0
      commit: 4981dca139abcdc638b65653b0022e3d84353bc6
[2/3] arm-bsp/corstone1000: move to support OP-TEE version 4.9
      commit: 955cd40e157f3a96c1f404760c404786ef976704
[3/3] arm/arm-bsp: optee: drop version 4.7.0
      commit: 38d2046583cd56d814f5de60478fd0dfe10e0b44

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

