Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 346FFC4332F
	for <webhook@archiver.kernel.org>; Mon,  3 Oct 2022 16:38:39 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com
 [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.web10.160.1664815110848992104
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 03 Oct 2022 09:38:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=JfHm3CDN;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.51,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f51.google.com with SMTP id g9so3407049qvo.12
        for <meta-arm@lists.yoctoproject.org>;
 Mon, 03 Oct 2022 09:38:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=BzOajZi0TsetEevTzUvmdhZ475mLlpuQ+8QJzogCcYg=;
        b=JfHm3CDN9asPW4zrhFaVwycIV8b11RnzkdakGq/F6SMq5FXGQOPO6monA2rYDbbc6q
         2Y0s4W4KAAFwmGGF+5aQu6oABW62Ef0tZ4Q85PEg9FlhMXGKdmfqOmcwh2JIgBhwHk/O
         6CEChLajxPIDdzgRWkX3UrCA4Beg354EEhqttGImPxmujTVKmPJgB7svURDoGIMK4ZV3
         aVCU2H5qtBg121zqaydyDlsKZpqixt98CsPr2TwiHJKsgjjDT206ccTxLiXz5J8yj+8l
         B57iGCPrULgDG/go/RuCM3bTrckZekX1zOT3lARmDPZBEzSeNNBFb72kL4mTL1djo5zj
         0Q3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=BzOajZi0TsetEevTzUvmdhZ475mLlpuQ+8QJzogCcYg=;
        b=snqpU7SSAqt0q7xc/1S4GaBTAXaYG9x8erd1Q803jA2NCW+ksOoX++UC84EH5UqWhe
         tZ2gyp2d179OWQT1B5f9J14O6XcK1EwbqwMboJIZEKnoT/OWzkwJeeHbR/XWYtyjSOsE
         nlPxIHAB5QDDa/aWai+oLOWla3RC90UAly+bTjwO6E8mdsnw0t6HLAio4jW6uMpVDCFn
         SFYi8TzuolMfbbhiyjaYxJfSTzILqlRvO5bIpyT9/bLztXSEGBIIFp2q+L0wCaK1PGFI
         FGxjMjtmwDS53V0+a0vOCK/d7siVICo8ECH2pzvAmsRlMULQS5F2mcbyDrYBkLg488bI
         Bk7Q==
X-Gm-Message-State: ACrzQf2gMC5O4jngxca8mFvueSjPbXbB3/cp2jJ+A+geXoySrCRemu1r
	YiA4ifmYSbmJaHlgm06ligEORnOdvOKLUw==
X-Google-Smtp-Source: 
 AMsMyM6dU7dUqTwWcjAFjD1/Wr7cfp9kmJdXuVUL7XAcXV5lIe+JxjSyZBLU/ligRVUY71O/A5tO/Q==
X-Received: by 2002:ad4:5dee:0:b0:4ac:b757:ccd with SMTP id
 jn14-20020ad45dee000000b004acb7570ccdmr16656404qvb.76.1664815116318;
        Mon, 03 Oct 2022 09:38:36 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id
 bs43-20020a05620a472b00b006b5df4d2c81sm11980303qkb.94.2022.10.03.09.38.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Oct 2022 09:38:35 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	"emekcan.aras@arm.com" <emekcan.aras@arm.com>,
	Jon.Mason@arm.com
Cc: nd@arm.com
Subject: Re: [PATCH 0/2] arm-bsp/test: Changing the repo names
Date: Mon,  3 Oct 2022 12:37:44 -0400
Message-Id: <166481506585.1286959.5307531293582758901.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221003101508.42204-1-emekcan.aras@arm.com>
References: <20221003101508.42204-1-emekcan.aras@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 03 Oct 2022 16:38:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3909

On Mon, 3 Oct 2022 11:15:06 +0100, emekcan.aras@arm.com wrote:
> Migrating the test repo to a new namespace under arm
> reference solution.
> 
> Emekcan Aras (2):
>   arm-bsp/test: Changing the test app repository
>   arm-bsp/external-system: Changing the RTX repo
> 
> [...]

Applied, thanks!

[1/2] arm-bsp/test: Changing the test app repository
      commit: f25935371da26d9b5f7b45d050c816acbe840604
[2/2] arm-bsp/external-system: Changing the RTX repo
      commit: 6ef4d3ef1877f8b9d2a5805bb13dff94b3e5bafa

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

