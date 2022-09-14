Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92D8EC6FA82
	for <webhook@archiver.kernel.org>; Wed, 14 Sep 2022 14:10:04 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com
 [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.web11.6725.1663164602289971465
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 14 Sep 2022 07:10:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=IZQrtlSS;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.170,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f170.google.com with SMTP id f13so6670270qkk.6
        for <meta-arm@lists.yoctoproject.org>;
 Wed, 14 Sep 2022 07:10:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=oi4kqqBrwotZ4k9VJZqJ5CiwKavr7T+pRLXBGOKPMaQ=;
        b=IZQrtlSSMjCayrApnccJsnIXYfxsvmfh0JeZOTyqGJ7ELiGqzSjXF95JKNrNgRD/I9
         HFhrSAYtlwaNgrsKTuLnOAH2nd9dwLJD0Ubn7ZKPEbtod+nFdLCW59YOo3Wjyjh1pD+t
         z78JeYdUu/RMbhr3EP5UluI6xlfm/84HeXchpgY97KY4rZ6CqfmnubUbwfCeYajk9fkd
         +5e7yfZfQokoN2sbAafrTliMZpHR/Th4EpXCwFvnFduDfzgy4hr7VnvVhx6E/WrLMo21
         56hOJtHmXTEQF2NCp/3ICmKjFNDKmAHNkvRZRN6aF3wqKGuFYAuG7DBiCfRUyVv4ekX+
         HV9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=oi4kqqBrwotZ4k9VJZqJ5CiwKavr7T+pRLXBGOKPMaQ=;
        b=ifL7V/MaAqLPcOE6gNVnCMgZ5iLo/bzRDV6kZduEHOKpkhfc2CaKTA0LpT1JK2ZJ9h
         5a21O5WnNQIw0+2gl7Mg74wydu7gb4B1dzKa+RK9KKXFu3QCusFfyBWC2UlifCv7c170
         b1l/Yl1s39hJyFO62gY0x4+lA7pbMgBk2u/acDOw6+HL7cmidg0l5ozlsRL+oZGgLhCn
         usmL3ByCUB5EtMCXjCCK5mhht7M6Zry5n9kqZNzN4r7ZNavB2m3Oli+/EbIi8YYVigie
         7Y4Dm3Xu6S266NJ1rNuw96gMFHzZpHb1fblcTUA7EVKPL/KGO3WZthZjop4WSCw5C/BV
         o2Mg==
X-Gm-Message-State: ACgBeo1d22LotMMHHq7sKoqSN+DVL4X/Th5jjp9ub2mwiKLq3TujgKy/
	5OfiHiUqFdmAMu+IzPgbtZCtlAmCMS5wrQ==
X-Google-Smtp-Source: 
 AA6agR7gV40wP6+5IODK7+2MEvGxg2a+CYiqcXCQOwiYjf4Pv9EJmj6hMu8l3JW/bQ1zn7ye3u0vqA==
X-Received: by 2002:a05:620a:17a0:b0:6cd:a185:131d with SMTP id
 ay32-20020a05620a17a000b006cda185131dmr18857217qkb.759.1663164600931;
        Wed, 14 Sep 2022 07:10:00 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id
 w4-20020ac86b04000000b00343057845f7sm1614215qts.20.2022.09.14.07.10.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Sep 2022 07:10:00 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	"mohamed.omarasaker@arm.com" <mohamed.omarasaker@arm.com>
Cc: nd@arm.com
Subject: Re: [PATCH 0/1] arm-bsp/n1sdp: update board-firmware version
Date: Wed, 14 Sep 2022 10:09:31 -0400
Message-Id: <166316457281.1963578.12370530233781726948.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220909134111.1074139-1-mohamed.omarasaker@arm.com>
References: <20220909134111.1074139-1-mohamed.omarasaker@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 14 Sep 2022 14:10:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3781

On Fri, 9 Sep 2022 14:41:10 +0100, mohamed.omarasaker@arm.com wrote:
> Update N1SDP board-firmware to N1SDP-2022.06.22
> 
> Mohamed Omar Asaker (1):
>   arm-bsp/n1sdp-board-firmware: upgrade to N1SDP-2022.06.22
> 
>  ...ware_2021.10.12.bb => n1sdp-board-firmware_2022.06.22.bb} | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>  rename meta-arm-bsp/recipes-bsp/images/{n1sdp-board-firmware_2021.10.12.bb => n1sdp-board-firmware_2022.06.22.bb} (79%)

Applied, thanks!

[1/1] arm-bsp/n1sdp-board-firmware: upgrade to N1SDP-2022.06.22
      commit: 23266ea6fbdb52f373c70b19b1982cf61e840852

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

