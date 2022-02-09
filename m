Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3054DC433F5
	for <webhook@archiver.kernel.org>; Wed,  9 Feb 2022 04:12:28 +0000 (UTC)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com
 [209.85.222.171])
 by mx.groups.io with SMTP id smtpd.web10.22199.1644379938855688485
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 08 Feb 2022 20:12:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=WLpITigJ;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.171,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f171.google.com with SMTP id 200so745143qki.2
        for <meta-arm@lists.yoctoproject.org>;
 Tue, 08 Feb 2022 20:12:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=0BXfEnuBxBzVKGK85JqDU4B4SpD1JuB6coI98f2AiD0=;
        b=WLpITigJAU2AcDC02EKF+BJSXD2SNLIicvRbywqdbnpCAKK0P7IXjOCf/OqoqyG3eJ
         v1vgsmX/GHwH713TyyUc64S4H2GN+WMB88neQv+w1u09tbg3GiKSH7Ry0j4lpto91pJG
         eMyfWGzPf2Txj7P3HO//NlACsNGczvGdxWMj7g72PonIPwt6P+RikPBqgZThYKQJFgPS
         HOO4fv/MnqWwX/AvZBbh9Zr+9EU/LVWrkS1WtMg29uDKCfCNvh0yL6qQ+OrgczuA5hE0
         MzgTe9mIj8VO9tTQVz+nWIjfZK8ILQPyGW1oiPNaTWi5YIkfwFteCWprDsLbTXVZQowH
         9y/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0BXfEnuBxBzVKGK85JqDU4B4SpD1JuB6coI98f2AiD0=;
        b=OuiW0PKl8728TXdCML793dTaYx3YyemDVOV9XmnlkBklP/n1cLpArPfGAdfV218OK8
         dfSAzAP5BIKrPbS/PnWKQmGi7vsojP7E98tZ3prkhAm+jT1XMMKoInaquOaWS/NXETem
         gEyZRdl779B2b1ArBEtD6xNtb8yhXKYBWhwBvCBRFq+1jCIETss9HN8Pl45Xn/nXc+W1
         q+JTrM63pb4bbUlobvFyoP7RoFLneGykyN8Y6pl/B2Gdu0decMhxP/xn0/vy2g0QhEym
         Q/dpo8PEGdA9sr6QBIxzaITkBD4FDOtyjzaB9xZEKP0eu/QqF4JtLhRMeIAtrNLyFI1x
         WRFQ==
X-Gm-Message-State: AOAM533t5vqUISwWwqZeGXHPBl3rdxhA5V0WEoIWmkhSmGxAt3rX9ool
	nBHM3YNCny1Rz0+f4e94+XwwHy5OWCfO6Q==
X-Google-Smtp-Source: 
 ABdhPJwpcKsYA9jvJzD21ENjvcjlACKjFUvuQuFVbyzpByKj3SYJ8r6nzh+RH8zvY2vVN4Z69puQKg==
X-Received: by 2002:a37:a793:: with SMTP id q141mr173369qke.401.1644379937883;
        Tue, 08 Feb 2022 20:12:17 -0800 (PST)
Received: from localhost ([2605:a601:a63c:b500:7d44:b4c2:2c3b:4a0e])
        by smtp.gmail.com with ESMTPSA id
 g11sm8334947qko.58.2022.02.08.20.12.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Feb 2022 20:12:17 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Subject: Re: [PATCH] arm-bsp/u-boot: remove unused 2020.10 recipe
Date: Tue,  8 Feb 2022 23:11:47 -0500
Message-Id: <164437990744.4093943.13298870122288977731.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220208203333.3098329-1-ross.burton@arm.com>
References: <20220208203333.3098329-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 09 Feb 2022 04:12:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2961

On Tue, 8 Feb 2022 20:33:33 +0000, Ross Burton wrote:
> This was last used by TC0, but that upgraded in 6bf368c.

Applied, thanks!

[1/1] arm-bsp/u-boot: remove unused 2020.10 recipe
      commit: 52bb585fa5f91184002ec6f18744a73236e78713

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

