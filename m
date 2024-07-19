Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BDABC3DA59
	for <webhook@archiver.kernel.org>; Fri, 19 Jul 2024 09:39:24 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web10.15221.1721381959159863806
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 19 Jul 2024 02:39:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=RRF5ktI+;
 spf=pass (domain: linaro.org, ip: 209.85.208.177, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2eea8ea8c06so24706271fa.2
        for <meta-arm@lists.yoctoproject.org>; Fri, 19 Jul 2024 02:39:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721381957; x=1721986757; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YHFSf40QpAndHpBCQa10KEgHhnMlojyAqRe5QUfnj8g=;
        b=RRF5ktI+qxNOZR8MiFzNOw3vZyCAnQB/YDlFCaJRHiF+6ib8fuDY+YiNCpQOV5Xwho
         60U8wOhQPasGThQEyX8GEo/y8NKXzf5mau9ieGsC4oGWkqMlz91iFLw4U8cw8grh8BpX
         wGs08hGZCdonxJSI1NqHVmsdwUbq7rClMbBMfVYprW5TRcQmZ4jnL95p6bHVcTJQYq4F
         /uxeT0h2bU4Y1RAExS3NoOHCIHAPUsdypeErZE3jRWaOomQlCdogsASz5Dt6snfqL0Es
         94N3K9FmuuKgNWMCytMD5QNrjFzqnX/qSOlCBoEjnl1p7hvbVUPPgnSf2azAtx6sKc17
         2FcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721381957; x=1721986757;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YHFSf40QpAndHpBCQa10KEgHhnMlojyAqRe5QUfnj8g=;
        b=H1IXrhfoE1g25wKSDjEVYp2QRItEAgJsrHyf7hHhQa5Apa4+0Vm7Xwtur85i0u7mZU
         AKqCY5uoVMoZ5bV/TowqgzJkTAc7nlBCPzkhe6XFGbzfmC8Z3/ekADCj7LBhY/pbc4Zj
         P1qb5g0OYnrKSuT29DZQs1llGRyqJ9uZ70H+IFwCVzCx4zRfpQObUc8A0jjlwn4BWxZu
         akXan/919Y6NINJXRtJXFjvG9BT4uBigFIzEmU+u+dPLH6r0l/hi/ne00mHKHNZmDpLF
         1yl312mIGAsSdjF+Ke2JnkJPK25WgC/krvkYBj5Tj8G4O26ODz7B2QMITbCJMYs5yP4k
         O3pg==
X-Gm-Message-State: AOJu0YyuaYNg6SyzGHNFe2eACr/7FkkR416p0b/bqh3McfwXAqo9/5Gu
	nsDll8CSRm/vBIBf1QvWxLZUnfEoU7OJEjtmIAEiLQTJXzm9Mi1xlmHftY4NOak=
X-Google-Smtp-Source: AGHT+IHUbOa/TXfP8+1Qkl1JIUinVJFCHw214qjPzaWNuXdd2pru21PypapaBJVpo1sngT33O/R2UA==
X-Received: by 2002:a2e:9256:0:b0:2ec:52f8:17ad with SMTP id 38308e7fff4ca-2ef05d41558mr29982371fa.45.1721381957311;
        Fri, 19 Jul 2024 02:39:17 -0700 (PDT)
Received: from nuoska (87-100-245-199.bb.dnainternet.fi. [87.100.245.199])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ef0fc51acbsm1521311fa.36.2024.07.19.02.39.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jul 2024 02:39:16 -0700 (PDT)
Date: Fri, 19 Jul 2024 12:39:14 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Javier Tia <javier.tia@linaro.org>
Cc: meta-arm@lists.yoctoproject.org, Ross Burton <Ross.Burton@arm.com>
Subject: Re: [PATCH v1 0/7] qemuarm64-secureboot: Enable UEFI Secure Boot
Message-ID: <Zpo0QjrYZuQg4snb@nuoska>
References: <20240718203526.52214-1-javier.tia@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240718203526.52214-1-javier.tia@linaro.org>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 19 Jul 2024 09:39:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5910

Hi,

Could you prefix each patch subject with recipe it actually changes?

That's the pattern in poky and meta-arm. Then if possible, keep
changes separate to each recipe and main config file (machine,
kas etc).

Thanks,

-Mikko

