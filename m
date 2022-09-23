Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 089B9C6FA82
	for <webhook@archiver.kernel.org>; Fri, 23 Sep 2022 15:32:14 +0000 (UTC)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com
 [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.web11.8948.1663947129308016908
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 23 Sep 2022 08:32:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=q45ZUSZE;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.176,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f176.google.com with SMTP id h28so351185qka.0
        for <meta-arm@lists.yoctoproject.org>;
 Fri, 23 Sep 2022 08:32:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=sRdFZxp0fbEJZRrw5G63yaVuaDxg7DCqnRR5bnI9gVA=;
        b=q45ZUSZETi5K9dIpfjJbjTbG3hdnGd6NwNGkd6iEufCRiukMQTRMV8HF39FWIsPDBh
         rGxWRTAPMyuI4HL8OMDevEUjcRtCzFoYmzf7SIX2h68cNfJ9DtrUFq/uTKXujqELVR1F
         QpkviDOtK7GIGg1JFEge1EYDnAVpRulDr54euC8F0uCNoTpW9dBL+9wLGFn2XNPsNQhL
         OKgnYFodyieL9oG06qWiftfS7Nf1g1LerWHqmuFBtFeQZOluony5zAdR7n/hGB63tTFc
         MkF0pevHlDKno2YhGLHtsAec5jiUDS9OOskGI/MgLTwUCBgTCZ+RgOj7jWm9zSEJUJIH
         yQbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=sRdFZxp0fbEJZRrw5G63yaVuaDxg7DCqnRR5bnI9gVA=;
        b=vb5FxblY7nJ7PkuqO/DYu/YSDfvktCC4NSS8NuGSXMAo/5Mry6EiITJFJjh/8oQf4A
         hU0nvdN/cl4VEDKTxWrdgS+1+yTDG9hHS62RGdE3AaTa8JKpTaGfkgkPd4/HW/chI+VA
         KcPGym61OGgk8ytIlNApoH5A0X3xUYAqSGzmVdmihRPYJWzIUYepcsLEphckrIgTMAa8
         NTSdaWyqbOf7YZp5kMiXZlfe9pQ66++p92WNO4uyGH4GlFaXlT00OCXu0yoRhbTHtkI/
         +UsJllHsrOiKGwFKdLhgCcC/r/mOvh8jaxFDLC9/v0FCaajFM5CLDljXRDsc8japP5q6
         xlNA==
X-Gm-Message-State: ACrzQf1nfKGX3BI8K8aOuLgQOGkZI/7GO9FOT56zzc54NIlVpIE5MyNe
	x6xMv1KySaGGZZ12RDng+yA5yZysBEYHmw==
X-Google-Smtp-Source: 
 AMsMyM45k5DqusgsUjvpE6bcCBgEAFWOOEjCWvCtaGGrX2XqLIHtlLnBa4VyNFXjGG4L0GblGbVVrA==
X-Received: by 2002:ae9:e816:0:b0:6cd:d849:859c with SMTP id
 a22-20020ae9e816000000b006cdd849859cmr5936362qkg.287.1663947128071;
        Fri, 23 Sep 2022 08:32:08 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id
 u2-20020ae9d802000000b006ce407b996asm5884304qkf.69.2022.09.23.08.32.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Sep 2022 08:32:07 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Khem Raj <raj.khem@gmail.com>
Subject: Re: [PATCH] linux-yocto: Add bbappend for 5.19
Date: Fri, 23 Sep 2022 11:31:02 -0400
Message-Id: <166394706726.2062239.9082706322469358699.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220912074647.3445905-1-raj.khem@gmail.com>
References: <20220912074647.3445905-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 23 Sep 2022 15:32:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3824

On Mon, 12 Sep 2022 00:46:47 -0700, Khem Raj wrote:
> Enable tee and arm-ffa driver on qemuarm/qemuarm64 by default

Applied, thanks!

[1/1] linux-yocto: Add bbappend for 5.19
      commit: 75ccc7847d8af5bfff4d6261a49530bb571d1a12

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

