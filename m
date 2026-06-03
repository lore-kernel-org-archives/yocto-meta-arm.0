Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BEB0CD6E4A
	for <webhook@archiver.kernel.org>; Wed,  3 Jun 2026 12:52:59 +0000 (UTC)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19149.1780491173423024524
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 03 Jun 2026 05:52:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20251104.gappssmtp.com header.s=20251104 header.b=AnEIQMSc;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.54, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-8cebfb15413so19905446d6.0
        for <meta-arm@lists.yoctoproject.org>; Wed, 03 Jun 2026 05:52:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20251104.gappssmtp.com; s=20251104; t=1780491172; x=1781095972; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VWcKpHgC1h42I/rhaIeeFRev1cnC18m+z41zNVYEFLI=;
        b=AnEIQMScPbb1+EDX/HPsX+odADT0njPFNeYZwQ3LyL/ch8UzFDAG6UbKdeSsFmNZ0i
         mkOqL56AbAeYanl0UsxVNO/rr5+zPCqyIhgi48vPiow1q2CiJhw5dDEWnxPIc1pyvHId
         cAFdWbb0dY7BYM0dHe2P9bEwNdUhc6qOKAceJfJmefI+6SKRXoWmXoVdquG/RxHULtwZ
         sR7tqy6d8kECQ1tWUA8dyMHC542es4vBKrhT9yKO3I2XKQt5EJiZTE57Rdyn5j8oyI27
         WixR1WQ98V6AxHG7aKbAJqF5rQqfsbHVsHFNQlLUshtx/ii4/nAwGnEOh5Mw+riS7lSW
         LUrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780491172; x=1781095972;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VWcKpHgC1h42I/rhaIeeFRev1cnC18m+z41zNVYEFLI=;
        b=Q8TQT+Aa2dHoZ5AqF7Tigmbgk/dKMdQVlGUsX8ahqZCYVWbKgwyhodUJ5ZB1l3xfsL
         LAXdnsXveNx42ZSOgEeb6QFfbf90yBrO1P2ibajAXXMpyhRs15uuDLGxUU8wRvUZLq4U
         EH6iLhdd3BtOgt3ngdJ6DYMtqi6rCDjbo0HdkqPrPsIKsYI9aJyFCwLd0iOZnPTMGaPW
         RYnRzkeoTo+jD+CBIlgGk0Ei0K5vkqdbhsdRUIMx4jdhFhVPBLSVRB0Iha+4K1TgYWYv
         jb+cJBhU2xoSmp/PiYquGCNansl/y1viNMF+yc3xPECY827CXnYauUwpa+oVmmrzTdFS
         39UA==
X-Gm-Message-State: AOJu0Yz4ctaVk96+v4NCUncU1BDOvTeftlc8B/VDvgyueGdlvB2iMv9D
	jDKt3UIB1khP0BGw3XcFyc6KLwDzA1RYM/C4jJpm31DCKobtRnNG4nUPPAr6+m30B70w8R4vwvc
	YTnKlSg==
X-Gm-Gg: Acq92OGIPBZ0PUcTIY1XF7Jh1vBFHZCmsT/jczOUFLP9HU4T/3AEIxteL/lnAYkcswT
	SpF7lyYwZSSuXfNg+KnfkQVZhXYm31KIvVloucBiKjc4MK5NihyVWb4wZg//15YuSwrpdUbsHWU
	9lXOJbvoXczx+VwAN+NU3FYAUV2qJH0r4VSRItoyCkj83uQ+I2ljUgIHolFA6mZC9xVvEGi6wEW
	Mou5rjwpuBmhSMH6EcxuILxoZ91A3xONI5sNr70cT8vWihnY4ufHY1Mh3jc66xeYyDnJ7YNhbbB
	zcwicupA69MaBPlVhZtO1cybTaRzUtoYOXu9Xo3YyCcwJzprJklf2zKD4eS6fyqUGOkf5l0K4DI
	Ch/g+kpNB6SW+gh2igXi9Yz8xq5m1Ggc9TX1h9QgaNyr8Z3Kk8LR08GsceZt4hat68lUR8Ywt+n
	yv8otdcomibn5bOYpoloxay6A=
X-Received: by 2002:a05:6214:5017:b0:8cc:f6a6:4854 with SMTP id 6a1803df08f44-8cecdf0a951mr43846486d6.26.1780491172398;
        Wed, 03 Jun 2026 05:52:52 -0700 (PDT)
Received: from localhost ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8cecd077be8sm19098196d6.40.2026.06.03.05.52.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 05:52:51 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Michael Safwat <michael.safwat@arm.com>
Subject: Re: [PATCH] runfvp: add --dry-run option
Date: Wed,  3 Jun 2026 08:52:35 -0400
Message-Id: <178049115561.2951988.16277018901087273679.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260528082357.893275-1-michael.safwat@arm.com>
References: <20260528082357.893275-1-michael.safwat@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 03 Jun 2026 12:52:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7070


On Thu, 28 May 2026 09:23:57 +0100, Michael Safwat wrote:
> Add a --dry-run option to scripts/runfvp to print the constructed
> FVP command line and exit without launching the model.
> 
> This is useful for checking parameters and reusing them with different
> FVP binaries.
> 
> 
> [...]

Applied, thanks!

[1/1] runfvp: add --dry-run option
      commit: 6ab14ea6405e23b1b706bcba60ee27074068a1c0

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

