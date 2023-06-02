Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2E5AC77B7A
	for <webhook@archiver.kernel.org>; Fri,  2 Jun 2023 06:45:10 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web11.6637.1685688303445567184
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 01 Jun 2023 23:45:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linaro.org header.s=google header.b=jzZAlVjA;
 spf=pass (domain: linaro.org, ip: 209.85.167.45, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-4f3b9755961so2250036e87.0
        for <meta-arm@lists.yoctoproject.org>; Thu, 01 Jun 2023 23:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685688301; x=1688280301;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mnLxj8gh26mbV2Yh7ykiKmeYGQV8D9ZgtDJTm1y1Sr0=;
        b=jzZAlVjAOK8VPq8RX6UmezEPh6eJLgjuG50GCWTG19gGQ8UwUwhq0Ncu/enWlYs3tL
         RJXs6EPYGT9EYydzT995t1YeYRdL0JNalimmsRGlwKpmyWyLCk+4SB68TzyaH3gV1Fpa
         0tCDguBdpBTLuIk+OnAz+61usiuDVijS7q9LJN7pm6ecJANgnZkMwGW7bIDfKSJiccX1
         woTm6vnRxoQC0GkTWBhVw0ztFxcn5Lu5obORbugiepEw4dEHCKB/j5i2HczZGsgPHdJ8
         1oq2bQSlZdMPbl4b1MeZNC7JshzQ6DKmoSIt51x1uLRi2rlgOxPh1rzQ+QICVlOSU3lF
         k+rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685688301; x=1688280301;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mnLxj8gh26mbV2Yh7ykiKmeYGQV8D9ZgtDJTm1y1Sr0=;
        b=T9m++rspE/0hu9477QfBY/mTlnLK0BJ2i7eWDzeB6X7QVVy2NI4YBDMjXpYsVLMha9
         zahnRCfomGmZb2c4XKDyQ2aMpmYTeyuKZoNHBwsLl2F3kJaTVuFkopk6MMfsq154auc/
         UOc/9ViZBu9pcmjFltqxdMZkkSz3PV6rQCq7owg/kaaqjgbkDQMzSpBTOTfnFydhutq0
         V2rB8/dIDhLaqo8aLFXmjIdfmYC5qGhYga6h1vgSKHgo47Rj3d5t3mXPcSMB75mR1o5C
         66cAOZEJi2Jw6Ex1G/S2C05+fmjaRmOX9CI1To624Q37g0p0jdMx7gT3CzQJa7fRu/A9
         YXoA==
X-Gm-Message-State: AC+VfDw0wov2QxumDuv0jGdk+BFqMr1tWaQVJwTUgyB7pJvk2+OiZiU4
	m/bxnwE75ihL5FjwMttSAvc0Dw==
X-Google-Smtp-Source: ACHHUZ7983biUy3WwktttIXRdnoIBuqfpsmWlHQ47An1h5/SB24GsS68zFGOZBEbAQDZDiC5ZvtviQ==
X-Received: by 2002:ac2:4465:0:b0:4ec:8615:303e with SMTP id y5-20020ac24465000000b004ec8615303emr1406604lfl.33.1685688301313;
        Thu, 01 Jun 2023 23:45:01 -0700 (PDT)
Received: from nuoska (dsl-olubng11-54f814-94.dhcp.inet.fi. [84.248.20.94])
        by smtp.gmail.com with ESMTPSA id c23-20020a197617000000b004f13ca69dc8sm63731lff.72.2023.06.01.23.45.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jun 2023 23:45:00 -0700 (PDT)
Date: Fri, 2 Jun 2023 09:44:58 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: alexandre.belloni@bootlin.com
Cc: Jon Mason <jon.mason@arm.com>, Ross Burton <ross.burton@arm.com>,
	meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] meta-arm AB failure
Message-ID: <ZHmP6kzHGHxvuBlH@nuoska>
References: <2023060122304545937f85@mail.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2023060122304545937f85@mail.local>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 02 Jun 2023 06:45:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4719

Hi,

On Fri, Jun 02, 2023 at 12:30:45AM +0200, Alexandre Belloni via lists.yoctoproject.org wrote:
> Hello,
> 
> Since the gcc-13 upgrade, meta-arm is failing on the autobuilders when
> building gcc-plugins for the kernel:
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/113/builds/4067/steps/13/logs/stdio

Looks like https://www.spinics.net/lists/kernel/msg4674124.html
could fix this gcc plugins compile failure.

But there's also an scp-firmware issue fixed with
https://lists.yoctoproject.org/g/meta-arm/message/4714 

Cheers,

-Mikko

