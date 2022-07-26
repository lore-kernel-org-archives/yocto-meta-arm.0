Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5AFAC00140
	for <webhook@archiver.kernel.org>; Tue, 26 Jul 2022 20:48:25 +0000 (UTC)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com
 [209.85.160.170])
 by mx.groups.io with SMTP id smtpd.web12.12082.1658868499840287519
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 26 Jul 2022 13:48:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=o/22q42u;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.170,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f170.google.com with SMTP id l14so11357634qtv.4
        for <meta-arm@lists.yoctoproject.org>;
 Tue, 26 Jul 2022 13:48:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IutZKALUEExxpigzDzZuRjbutFpckfjKrl9qMSj7I9E=;
        b=o/22q42u1fnrn6gcIL09dSKrjuVnPjLFgInCGv9a5nfX9De6R+PrzhViJnGPu2kApK
         1Tp/fBrWsZSMz/PLEf8JCXOyViz7s+Uj8iZgnnchapA/h0xBgeGi3WJJJF+eG6/7nPKV
         zhlK5+VFzxYseAr5VaFS3b7Kl/iTWwJI5O2LcZhabiqRCfYTO4hsF5Km3S6PlKZTsPkw
         ZaHwFMmC/X/MXopxjqWqpVKrWJjDjXOunkYg4dwv9QY6GEMPpCCGu0pKc3gpfZwdaxTQ
         zmfQR0Equ4PpytccE7nNeb0YUV1iz1wM2gzDKgSFt/h3riEcPxuJvHa+xm946S61Otgh
         GT5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IutZKALUEExxpigzDzZuRjbutFpckfjKrl9qMSj7I9E=;
        b=r0SA3G6AcL9yntw7+xG7negqV3wSrIN85A4hdRbVAAuvc9AJyYX91m5EjXYCoAi278
         UoaWb66Yu9MEdhw4O4A6xERLElZi9Xv28UpSAKwvjlhC6bGJOX4KItSQVkRBYpgZLBLC
         ct83aPNCQk8TTdJqfSKnXpQNpwn6RqtZqxNvqPD7+4fE9aCVYTqmA7ykxHAQ391nt/1S
         wcHhR3WZeDON/xFvB0QBx1J8a1BjvIYitrV9YcbuOjxJ7KlNEaKqqqTMrMSQ4dXPlpzI
         gjQFDEqLq+1OtIm3efnty+UzMadLKoMr5lfWuyB+HlNVG2glawtgObaYUQisRjkLv9DE
         MmjQ==
X-Gm-Message-State: AJIora+GoAXfA27ZtGdE7bwR7a6XWU7D2GsKPtpb25TbZetwQigCoAwi
	CaP7u9itvrP+GsCwyvyR70u8qYz0+Vfjlik9
X-Google-Smtp-Source: 
 AGRyM1v0u3UGsqJIbUgBYY521PVAkvQ036y3uv/1GXG4pVuMWDQkPKAxMdeL7tm11ZAuGkCKBvOavw==
X-Received: by 2002:ac8:5a12:0:b0:31e:f233:50f1 with SMTP id
 n18-20020ac85a12000000b0031ef23350f1mr15940855qta.229.1658868498393;
        Tue, 26 Jul 2022 13:48:18 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id
 o7-20020a05620a2a0700b006b5683ee311sm12812097qkp.100.2022.07.26.13.48.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jul 2022 13:48:17 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Peter Hoyes <peter.hoyes@arm.com>
Cc: diego.sueiro@arm.com,
	Peter Hoyes <Peter.Hoyes@arm.com>
Subject: Re: [PATCH] arm/oeqa: Fix regex warning in linuxboot test case
Date: Tue, 26 Jul 2022 16:48:01 -0400
Message-Id: <165886848111.1179859.10226758370769335566.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220726153536.3573383-1-peter.hoyes@arm.com>
References: <20220726153536.3573383-1-peter.hoyes@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 26 Jul 2022 20:48:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3595

On Tue, 26 Jul 2022 16:35:36 +0100, Peter Hoyes wrote:
> The linuxboot test case prints the following in log.do_testimage, only
> when executing testimage without a pycache:
> 
>   linuxboot.py:18: DeprecationWarning: invalid escape sequence \:
>     self.target.expect(self.console, "login\:", timeout=10*60)
> 
> Fix the warning by escaping the ':' character correctly in the pexpect
> regex.

Applied, thanks!

[1/1] arm/oeqa: Fix regex warning in linuxboot test case
      commit: ef879b5fb87910b80ed19e7bf036d3c6b0684f89

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

