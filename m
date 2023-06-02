Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E43DBC77B7A
	for <webhook@archiver.kernel.org>; Fri,  2 Jun 2023 07:01:20 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web10.6880.1685689273925850871
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 02 Jun 2023 00:01:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linaro.org header.s=google header.b=ULSV+Yhz;
 spf=pass (domain: linaro.org, ip: 209.85.167.51, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-4eed764a10cso2217176e87.0
        for <meta-arm@lists.yoctoproject.org>; Fri, 02 Jun 2023 00:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685689272; x=1688281272;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IR15CBV6J3byNJsDt0SThhS0QG9VhAHBDN6QZnlcpVE=;
        b=ULSV+Yhz9NVG99GG8tx/gP4yVq/OKB6oZI9zB9WAExHgWAY/a08SRjJHy4yI9VVHcq
         doiClWxYaLWeJTOhyZ9wVsOO0mtNqYw0efuXERo10hYBf3i8wD0/E+GfjQFWP7pl/bMx
         CupQSPfSZJmVm04mEYEQMVgkMuA+28veSLV8Poey6+VcKin97lhRQTPs/6pjjS6H2X0B
         /92agwGBd989YeGWVD97bMn6ryhFoPV7c+P489mNYidW2HsK/pXsVmJoog2DEjr4uOg8
         3nfTFJl84JCzUbJzdwuBm2QGkuS6Y7q8WaNtWx1ptZpLr+sz25kbbY5wsuYkzut0vSYX
         sCsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685689272; x=1688281272;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IR15CBV6J3byNJsDt0SThhS0QG9VhAHBDN6QZnlcpVE=;
        b=exJKUKAEhU7fr2HHTi7BmaNKNZB79G2FxpYJ/XfydIN3ZZ58RBOZ0kQN7y5OYRhojy
         eln5taIxhYPQGcmho8I5jXsAM6pMaz2BjVw/n8pr6dL5Hy5on4stuykKp0ZHmjvlbHy6
         kuPJtECHfp7rDqJ5Ff/afJ28rMh27fct/dTtS9Q83Mcfj3gL8TkLod5rsW0VeqqPsvPm
         JahH2jEDGoAEGeuO1ZEMjoIq2eaoklk94Pub+JQPkR7MKRhjWFGcxi0yecTKTgjgnty6
         2MidHfMbn1g41gK7fU6S0+cDuJ0/2zUhsxpDb7NQC2urNj4jTSuwDVgBgvvRfSCWH46w
         8Jvg==
X-Gm-Message-State: AC+VfDw77uHeQL/qa4S1EfqtHFETUWDUg3IzPQgj0ycxxN6NE3ZHaZPY
	6x69W6RLr8AZjfA0XKTuCW/kxA==
X-Google-Smtp-Source: ACHHUZ6vkH1Es2Dqghn3bpPtBGHtDFsSlP9SARxZAz/R42dtAbKWW2ncwBjX1mnF2gEDUtTA/iEpOQ==
X-Received: by 2002:ac2:5d6c:0:b0:4f2:509b:87ba with SMTP id h12-20020ac25d6c000000b004f2509b87bamr1150056lft.50.1685689271790;
        Fri, 02 Jun 2023 00:01:11 -0700 (PDT)
Received: from nuoska (dsl-olubng11-54f814-94.dhcp.inet.fi. [84.248.20.94])
        by smtp.gmail.com with ESMTPSA id w27-20020a05651204db00b004f60f2979e6sm67655lfq.83.2023.06.02.00.01.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jun 2023 00:01:11 -0700 (PDT)
Date: Fri, 2 Jun 2023 10:01:09 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: alexandre.belloni@bootlin.com, Jon Mason <jon.mason@arm.com>,
	Ross Burton <ross.burton@arm.com>, meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] meta-arm AB failure
Message-ID: <ZHmTtUvxCrYRnnZp@nuoska>
References: <2023060122304545937f85@mail.local>
 <1764C494D3820FDC.16620@lists.yoctoproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1764C494D3820FDC.16620@lists.yoctoproject.org>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 02 Jun 2023 07:01:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4720

Hi,

On Fri, Jun 02, 2023 at 09:44:58AM +0300, Mikko Rapeli via lists.yoctoproject.org wrote:
> Hi,
> 
> On Fri, Jun 02, 2023 at 12:30:45AM +0200, Alexandre Belloni via lists.yoctoproject.org wrote:
> > Hello,
> > 
> > Since the gcc-13 upgrade, meta-arm is failing on the autobuilders when
> > building gcc-plugins for the kernel:
> > 
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/113/builds/4067/steps/13/logs/stdio
> 
> Looks like https://www.spinics.net/lists/kernel/msg4674124.html
> could fix this gcc plugins compile failure.

Actually more like
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=e6a71160cc145e18ab45195abf89884112e02dfb

Cheers,

-Mikko

