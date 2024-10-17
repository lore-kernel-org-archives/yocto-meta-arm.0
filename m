Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 367ACD2126E
	for <webhook@archiver.kernel.org>; Thu, 17 Oct 2024 09:52:54 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web11.45469.1729158764252170003
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 17 Oct 2024 02:52:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=Bcznbr5i;
 spf=pass (domain: linaro.org, ip: 209.85.167.49, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-539f76a6f0dso652655e87.1
        for <meta-arm@lists.yoctoproject.org>; Thu, 17 Oct 2024 02:52:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729158762; x=1729763562; darn=lists.yoctoproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=s0MnNa864l26+B8DSUY9nU6dK6WrtFLPQR2dB1atN7c=;
        b=Bcznbr5iJa3cSLBEdFh7tv+qrEXB0NphQ4tfIC4vlI+BbeBnLedQ6so69o6yXKhYle
         IC5RPrdLUUM/k/BmCKwQ04zoTsb6gUbQJ82SRYj2GgHoP9lknIpYLWvKwkSaJnjQjsfi
         J3cbW8NqfN+/xGftdsmkIvhWKwptIDOOL5jR9n3OEkjqC2Cn1l+c9DjsfJrNZnOdfgug
         vE+Fe1dY3MJxKRrYXnGkUB4Kzm/jGyLgTi6eYc0hN4UY6U4XIJSm/hn0/jvjXJ93mP0m
         kFAfiUUNHg405HZVLlLmp8skOxvc6ww6jAUqEbNXc+rYV6zmLRZH/4o95WvjRSo7tXo1
         5CVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729158762; x=1729763562;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s0MnNa864l26+B8DSUY9nU6dK6WrtFLPQR2dB1atN7c=;
        b=YrDgXPbjppF6npTr6F0x9YCCkHQ41pXHyHZWEgmuwlKpaydTL/d4GJWZMQFgc02n3g
         Y6n1pOAdqZ/KHgZsKzmRVmAkP8LMKyexbooXJpyQpOVErhWbiHb8W8ZVB9s1+XC49dgE
         u/5aZka0BdNezNWdZRh/M0aFuIeQ+7zjlu5yxoKePbbHBRtQ9Vl9GIB3y+OCZSuPYL6l
         4tXBPOwcPNfizhneQPMdxxbFBfmTe1m8m6r9CoZX6b+868U5ch/KOwVvXIVADM0gL81H
         GBo2a8/uYUgURgCobPQb4LdmSiixk3N3zLNQHABDB19m1xdjeEwyudy7nh6L6qprXSVt
         dxWw==
X-Gm-Message-State: AOJu0YxJe0C8YBjyaAO6GY60EiUpjsgOqzdEpWueGwD+cZP9sI6SKxio
	kzbxg1bV445u3XH2qYUBY5Upd4rWjCx4nfhLnIh86ZxgeozQWKzsVk/hRgZw3kw=
X-Google-Smtp-Source: AGHT+IGwnCCEeXdiO8Dn/vphJ77AnHIW5KeMPiAtOeLFIlEJIGe32yFyFrdsYt2U9Io9juCM5rqACA==
X-Received: by 2002:a05:6512:4010:b0:539:f035:e158 with SMTP id 2adb3069b0e04-539f035e2abmr8653491e87.18.1729158762095;
        Thu, 17 Oct 2024 02:52:42 -0700 (PDT)
Received: from nuoska (78-27-76-97.bb.dnainternet.fi. [78.27.76.97])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53a00013f8bsm717081e87.286.2024.10.17.02.52.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2024 02:52:40 -0700 (PDT)
Date: Thu, 17 Oct 2024 12:52:38 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Gyorgy Szing <Gyorgy.Szing@arm.com>
Cc: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
Subject: Re: [meta-arm] [PATCH v3 2/2] trusted-service: remove optee udev and
 group settings
Message-ID: <ZxDeZvHXRUmITGKd@nuoska>
References: <20241017065907.172504-1-mikko.rapeli@linaro.org>
 <20241017065907.172504-2-mikko.rapeli@linaro.org>
 <AS8PR08MB589563A608DE289457643CA991472@AS8PR08MB5895.eurprd08.prod.outlook.com>
 <ZxDMGLYsOSe9rPFO@nuoska>
 <AS8PR08MB589512524CBB7BFB377101C391472@AS8PR08MB5895.eurprd08.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <AS8PR08MB589512524CBB7BFB377101C391472@AS8PR08MB5895.eurprd08.prod.outlook.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 17 Oct 2024 09:52:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6208

Hi,

On Thu, Oct 17, 2024 at 09:44:07AM +0000, Gyorgy Szing wrote:
> Hi,
> 
> The Trusted Services protocol is implemented by the tstee driver and libts.  This means there are multiple drivers using the tee subsystem and multiple ecosystems relying on the /dev/tee devices.
> Your changes move the tee driver access configuration to the op-tee client only and this adds a dependency between the two ecosystems. The TS ecosystem will not work without the op-tee client, but op-tee client is not part of that ecosystem.

But optee and optee-client are part of the TS images and configs so there is a link.

> Yes, the /dev/tee* devices will be still there, but only accessible with root privileges which is kind of a feature degradation.

I don't see any user being added to the previously used "teeclnt" group.
So which non-root users are there? If the users are in Cassini, I have
proposed fixes there.

> “If this impacts libts users, then IMO they need to install optee-client orsetup the udev rules etc in some other way.“
> Yes, this “some other way” is the udev rules config you are removing.
> 
> “Is there some problem I missed or a setup which is not covered in meta-arm testing?”
> AFAIK currently there is no meta-arm config which enables FF-A but does not use the OP-TEE SPMC. But this will change soon. So why not do this properly now?

What is the proper way to fix this?

I don't think duplicating optee/tee-supplicant udev rules is the answer.
I could move optee-client recipe udev rules to a separate binary package
to enable installing without tee-supplicant. But I'd like to see the
users and have a test case, preferably in meta-arm.

Cheers,

-Mikko

