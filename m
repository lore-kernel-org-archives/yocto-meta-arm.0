Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42C03C4332F
	for <webhook@archiver.kernel.org>; Tue, 11 Oct 2022 14:59:41 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com
 [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.web12.8487.1665500374129785111
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 11 Oct 2022 07:59:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=2vm8RIja;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.170,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f170.google.com with SMTP id 8so1160716qka.1
        for <meta-arm@lists.yoctoproject.org>;
 Tue, 11 Oct 2022 07:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vS+mPi4DcXbF0SkzowkEqkmTdbcAP7ip7N/PIpZXz78=;
        b=2vm8RIjaAUaFwdeibLJYAYDk2l1y0uHmgf9eH5MFEX0TrSac9oJz5h/jsIqhtVY/bx
         equgrM/TINUtfkXdcCXvBaOPHHRrEiprpj3my3MQFKWYjpiiWJVye9bxNGO1liWAKDeD
         3mB+xy6KNLw03MVv14bkAzI0sB/421CM0EB53AMXHoXNqfB7z+srSfZp6kIph0l3k9To
         419DppYMTIC4OoYbBhSFwJdOHv1/wuIYnmxhDaaNiKWBd+Ytx/1balVaVR6r9evh/Guh
         /fc94u6fcLiWr1RzxztZbAV6AvwIf7ictsX3xK1mnoaG4eUdUxtJkZo7AwWEKJoBsDd/
         4U3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vS+mPi4DcXbF0SkzowkEqkmTdbcAP7ip7N/PIpZXz78=;
        b=YRLq0tqW8IrwNK0x8Z5xfwb6yO4pHn4du1sg90dDh9vfqJihPBcsCQS4neaWFK5Jha
         MSy1qDLEH9rRH62l3jZT3eS9xwl8VNjszsi5nXTvbTeyNRBII8ogHqX9Pig/r6gVtYpX
         0HI3rX6bjWVSGqrfvL6cxvbH5Qi3qfpxLpt8utIJWXwL2OldA6yWKeAnCuTWS1EaPNC9
         mmw2oJ7x6/Ook+G1NisLlNj2bPticD3BrXfhTn2uSp9F04v7h8GIAUAKhpZiB6iVHNrG
         f9VxCva2OL1Cd5w7rPOxikeFT8a08k8IkypAPe+YVu4UZRuvYnVTEGZSPBXtuNGQs18q
         BY3A==
X-Gm-Message-State: ACrzQf00QHpyxEuBBnmvO48mfestyystxDnXxP5DiXrSzs353u5gStwr
	Ig2Dy8b9EyDPScuLYuFUj0KVUCmOpXgfCQ==
X-Google-Smtp-Source: 
 AMsMyM5P/RChI8ottd8vAHPl/RLzrtCCJg0KzFSlCWHjSDkR/7HBqux4+MZvlV8S6Epr8RjfaEZjBg==
X-Received: by 2002:a05:620a:488e:b0:6ce:9f9b:6f88 with SMTP id
 ea14-20020a05620a488e00b006ce9f9b6f88mr16642030qkb.64.1665500376967;
        Tue, 11 Oct 2022 07:59:36 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id
 s2-20020a05620a29c200b006cbdc9f178esm12915474qkp.25.2022.10.11.07.59.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Oct 2022 07:59:36 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Cc: nd@arm.com
Subject: Re: [PATCH] CI: restrict compression threading
Date: Tue, 11 Oct 2022 10:29:56 -0400
Message-Id: <166549859651.944759.15631157314370678967.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221011130710.1638676-1-ross.burton@arm.com>
References: <20221011130710.1638676-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 11 Oct 2022 14:59:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3951

On Tue, 11 Oct 2022 14:07:10 +0100, Ross Burton wrote:
> On large systems, using all of the CPUs and 50% of the RAM when xz
> compressing packages is actively harmful because it will happily use up
> to that limit.

Applied, thanks!

[1/1] CI: restrict compression threading
      commit: cbcb1bf39de2cd7205447af9a64442402fbdc6f2

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

