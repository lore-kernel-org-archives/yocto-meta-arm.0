Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3763C433F5
	for <webhook@archiver.kernel.org>; Mon, 13 Dec 2021 21:11:47 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com
 [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.web08.17160.1639429906995371776
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 13 Dec 2021 13:11:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=K6qSbHwL;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.47,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f47.google.com with SMTP id j9so15575972qvm.10
        for <meta-arm@lists.yoctoproject.org>;
 Mon, 13 Dec 2021 13:11:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vPZQaysFxgXRIAgu13v7W6I9YArKHeUMMAmQk8VmUPs=;
        b=K6qSbHwLmsu767blBn0dAOmRGjoUAx7OWb6Gsvu/m0QhhLhIAEi0Z2RnXSC0zXh3XO
         BONq/oxGOhMQuDdYsPcjGWVssecu+Xyl6LQYVUQeGROUFTRssYECAIa7NAkaTAV/dZqU
         XJ0Py1HDzUUImC6chAhWn2mbXJZP+0bmUx9cdWXLxsaR73j23785QmMPlkPN9JhStmFX
         5pmQ+ZsnMyNjcv1b/6KD0dpYBa59J8xXdQ6twGoub/3HY/j70RDnjtce6qPDn+351BIi
         V1oB+jTbMAGTftCKD+kkR8KLPj5vtos8N1LO58RWtKn69jnMI3K3ukaYEhPmwxaELSUO
         foKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vPZQaysFxgXRIAgu13v7W6I9YArKHeUMMAmQk8VmUPs=;
        b=eA8qkyFOm2oanTMFCXt1B5I4kS4GrR8fpGWECWtqFwuSfbmE3kJv3OtHOrX17Y0ZId
         L02XQSzNNDDWODVF/6scfK4RySgUgaMQpA/bPHFTHNWmtjYLcQDGV/XD4JWm7cJvTMbd
         5fg6h0vAp/hG9AIS7cE10NQvd62jHpKh0OPZYSkk8r0YT8xJJ3koQzOieAEV+h+b60i7
         QHInHnrC+de7wpGdyerZ4nOv61OAEKskpnEqjISbre0ZtinKUB72pEcB9Jcac0FCvJ2T
         QW2HuPTWj8zCo3544FUUTNLNs1wKyrFf0fH6NegJSJWerFvHKgZqAbN3uXUUJMORawOC
         E62Q==
X-Gm-Message-State: AOAM5304eCa8xv+U6b8Mx2g7LYRteihLSgDyf9wOmFHas/KLSI0oIWnD
	6rjhCM5dKlFJm+1hVPU2V/NER5gN4m+XYC86
X-Google-Smtp-Source: 
 ABdhPJxumRZkoEr4gsbX48jBgGzeiR3zDKaWgPWo/V7zhV8DO4Gns+ucT5Aa8UbBkqiF2Ug7tbNDkg==
X-Received: by 2002:a05:6214:519c:: with SMTP id
 kl28mr751158qvb.71.1639429905878;
        Mon, 13 Dec 2021 13:11:45 -0800 (PST)
Received: from localhost ([2605:a601:a628:a600:d1ff:1ef4:15c8:ccc1])
        by smtp.gmail.com with ESMTPSA id
 r26sm9559074qtm.67.2021.12.13.13.11.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Dec 2021 13:11:45 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	abdellatif.elkhlifi@arm.com
Cc: nd@arm.com
Subject: Re: [PATCH 0/4] corstone1000: out-of-tree u-boot patches
Date: Mon, 13 Dec 2021 16:11:01 -0500
Message-Id: <163942986493.20284.14130576914579415832.b4-ty@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211213132227.5490-1-abdellatif.elkhlifi@arm.com>
References: <20211213132227.5490-1-abdellatif.elkhlifi@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 13 Dec 2021 21:11:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2670

On Mon, 13 Dec 2021 13:22:23 +0000, abdellatif.elkhlifi@arm.com wrote:
> From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
> 
> Platform specific patches for Corstone1000.
> 
> Abdellatif El Khlifi (2):
>   arm-bsp/u-boot: corstone1000: arm_ffa: removing the cast when using
>     binary OR on FIELD_PREP macros
>   arm-bsp/u-boot: corstone1000: add the header file for
>     invalidate_dcache_all function
> 
> [...]

Applied, thanks!

[1/2] arm/sbsa-acs: reset PACKAGE_ARCH
      commit: b180c39f152218d5b7da0f33403305e98a21d00b
[2/2] arm/sbsa-acs: upgrade to 3.1
      commit: 93d5313f60f9edb856b61f80370dd5797c5e5878
[3/4] arm-bsp/u-boot: corstone1000: arm_ffa: removing the cast when using binary OR on FIELD_PREP macros
      commit: 3c30cb6f061d195733871a923c1b527b63593159
[4/4] arm-bsp/u-boot: corstone1000: add the header file for invalidate_dcache_all function
      commit: fcf135d7ee3e4942be24d6e47fa661680237fea3

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

