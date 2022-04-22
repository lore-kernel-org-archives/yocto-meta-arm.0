Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBDFEC433F5
	for <webhook@archiver.kernel.org>; Mon, 25 Apr 2022 19:26:10 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com
 [209.85.160.180])
 by mx.groups.io with SMTP id smtpd.web09.46.1650662463453348456
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 22 Apr 2022 14:21:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=k6UKJDxg;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.180,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f180.google.com with SMTP id f14so6439072qtq.1
        for <meta-arm@lists.yoctoproject.org>;
 Fri, 22 Apr 2022 14:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=GhDfqMyzeB2/MCUW2jEnWRvS0n3oGVn7rm8CjX1eMuw=;
        b=k6UKJDxgeAsvSNcANVigDaVOUxYEZ1ek5G0LV5MCRt2UEcUUjuy5qOKBwxdU7wh1hD
         FLd1U+BRQrp/ksrV0TvLP/fKx5N62yNT4J4fNJrjoJ0dIruORdmgNBqk0/e8yRXO5hxE
         JobAbrFwOjuiSZeQ3HKM1bdCgIFZMFgH0Ace7nzRjgEn19Ax2kjoVLQ175/FZ8laWh9m
         0iPR5mFW2pfc+xw2Nz+q3YlfI/kyTJBvNc0WtGKTwIdy3nkaK5Kwt1D/Rmfa37LGYcnz
         ea0KqxYf8O7ixRfxmkYJ3ToiLzGzg1bOZrtAmrkwPjLC4elWO+UC6Uucnzg4dKHLESWh
         PazQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GhDfqMyzeB2/MCUW2jEnWRvS0n3oGVn7rm8CjX1eMuw=;
        b=E6SiZSDkKtYTeYRga7E91dY/O9tn+Za5OhjlrRaQEl0ea7Lu1eI44lv+6c9WCPiwEj
         uXttfNjd/rZGKN9aHa+7Rn1vN6HUW25yLpiJXcTnq2boO+Hkej+sqMT1od7gtNeIuZLw
         YFoIletX1uVudRgHN8CwcLbV1GKqHFMG4jZES2rd2EQ9lbtH+0F6a4si4wCNIpvZVz4M
         IT3X19B3s+q9eG4EgoFmotExfUNOUz7SUaPd61hkhovnTcwjJoabLROrf9UkXUCRyfYy
         Y6Ia2Trerl2lO267es2JI7rdDTIGlCT1xqqAgLBv7D3/lcNftC0+LnAad1nzJRUaeK0m
         q+kw==
X-Gm-Message-State: AOAM530cz9xzQsRJ0cbX3tfElFDRZ6x7hsf7GwNujTVfOLw2RjwZRPud
	fFeSN9LbXfI+NVbfGcCwEpdrRy6nTSLgqA==
X-Google-Smtp-Source: 
 ABdhPJzee4E+96SgueNzEONzLY8loxFVUV4RqWSS9tOS7dv22yJ7Fte2AZ6pmmmkXDD1a4sv8uTPJA==
X-Received: by 2002:a05:622a:6101:b0:2f1:df05:b084 with SMTP id
 hg1-20020a05622a610100b002f1df05b084mr4783236qtb.580.1650662462499;
        Fri, 22 Apr 2022 14:21:02 -0700 (PDT)
Received: from localhost ([2605:a601:a66c:b900:3b2f:a3a7:b707:646])
        by smtp.gmail.com with ESMTPSA id
 n81-20020a37a454000000b0069e66f8a905sm1378011qke.17.2022.04.22.14.21.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Apr 2022 14:21:01 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH 1/3] arm-bsp/juno: use virtual/bootloader for u-boot/edk2
Date: Fri, 22 Apr 2022 17:20:52 -0400
Message-Id: <165066245225.3353396.18054091004083239652.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220422151326.23359-1-jon.mason@arm.com>
References: <20220422151326.23359-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 25 Apr 2022 19:26:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3293

On Fri, 22 Apr 2022 11:13:24 -0400, Jon Mason wrote:
> To setup juno to use either u-boot or edk2 in CI, abstract out the
> relevant parts and setup the parts to allow for it to be done
> dynamically.

Applied, thanks!

[1/3] arm-bsp/juno: use virtual/bootloader for u-boot/edk2
      commit: 2b6e3fc1d160566d31e1dad4630da0b8ce5686ed
[2/3] arm/edk2-firmware: add PROVIDES virtual/bootloader
      commit: b37441921d732a707181619f6dfc40f602a77081
[3/3] CI: add testing for edk2
      commit: 9f0c90506661b34d5546f5f9ae9a43f07ed78ee9

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

