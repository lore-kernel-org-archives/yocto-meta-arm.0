Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5032D21279
	for <webhook@archiver.kernel.org>; Thu, 17 Oct 2024 11:09:24 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.web11.46552.1729163362227890909
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 17 Oct 2024 04:09:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=daOtxEiO;
 spf=pass (domain: linaro.org, ip: 209.85.208.170, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2fb5be4381dso9985941fa.2
        for <meta-arm@lists.yoctoproject.org>; Thu, 17 Oct 2024 04:09:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729163360; x=1729768160; darn=lists.yoctoproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uIbj4hRy7RIYgXXfKM677340Rsn6WpNs8tNH+JwrkpI=;
        b=daOtxEiOP/tVR+3xmkIX62AeBSsq/MMd6gwm29PhVbKYF52N/1Z3yObEw6EMbC5HY/
         4jX6X5iRaDGNhLsQEFhz22IHVbrQNvojFxWCkKutCLoU6RsndPwc6LFFdt/xR0xyVhSI
         rRh1rCbswgGrlUJonmOPggqSgxCkk16Qhu7A4QPQnJspmeGsWxaqtRK94Dv3iKpVY2pv
         nzoNMVGm6/+z0cN1uM24BQm/1rsD1qyFynRN2LX+CG6KNrzkSqtBPirZ4l4JINWcNp9z
         D+VnJEDm7Ud7Sxd6MsNOApfYihplx/EusJ/XI7HforsWVTUgz8tdldWpFuftxftUWFuR
         6VmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729163360; x=1729768160;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uIbj4hRy7RIYgXXfKM677340Rsn6WpNs8tNH+JwrkpI=;
        b=A8PWrSnTcHU2VhaGmEOw78aEnDZ0lBmgdUcm0YdpJXEwSvr2aHHayDmUkylBFRF9ix
         qKl+AU5d4sOG5h1euefOPrtnfQScspUBVOYv/AjKqxxfywgTP1MTB2wJR2t6ZVzarxJi
         Zd1uiBpO4X7Pd/9Axxc2bOXNDXWRp0WMEaCI8nJBfLEv5vBHZ9lLwQV1DKjt1bPzI/OX
         i5l9r98odztSGvGvL522aLbNGuBpU00Km7nA2geOMteVj3pvwjHCp6RMc0ELDdAVjA16
         uvWmlio6MPE7wxTY8f3cY2Ia7P1M88T7mgmnPSaDVl6LyYxMIrj4PBQh9Erdm0tisb6A
         Faew==
X-Gm-Message-State: AOJu0YwF7A8zucYUPx62UIDWBVeRaredImkbSyIUKOCkax3CZMxAOqXG
	G/yekUfMf/JEbnYg1ilZfYCPFldDZ9TD+DTrVAXAjmOJqGj6jY6m5ejZuH2TD7I=
X-Google-Smtp-Source: AGHT+IFXSIXRQ4yI+4Ipbt+wImbV9m4IrSZl6ra8EUajX/bZFQdVv8MHI2wNGwgIlVIFhfG8BeYb1A==
X-Received: by 2002:a2e:4e11:0:b0:2fb:57d6:f464 with SMTP id 38308e7fff4ca-2fb61b5645amr36846001fa.20.1729163360206;
        Thu, 17 Oct 2024 04:09:20 -0700 (PDT)
Received: from nuoska (78-27-76-97.bb.dnainternet.fi. [78.27.76.97])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fb5d126336sm6920551fa.37.2024.10.17.04.09.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2024 04:09:19 -0700 (PDT)
Date: Thu, 17 Oct 2024 14:09:17 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Gyorgy Szing <Gyorgy.Szing@arm.com>
Cc: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
Subject: Re: [meta-arm] [PATCH v3 2/2] trusted-service: remove optee udev and
 group settings
Message-ID: <ZxDwXeOdfwuCsI_p@nuoska>
References: <20241017065907.172504-1-mikko.rapeli@linaro.org>
 <20241017065907.172504-2-mikko.rapeli@linaro.org>
 <AS8PR08MB589563A608DE289457643CA991472@AS8PR08MB5895.eurprd08.prod.outlook.com>
 <ZxDMGLYsOSe9rPFO@nuoska>
 <AS8PR08MB589512524CBB7BFB377101C391472@AS8PR08MB5895.eurprd08.prod.outlook.com>
 <ZxDeZvHXRUmITGKd@nuoska>
 <AS8PR08MB58951A0CBE556C313695963291472@AS8PR08MB5895.eurprd08.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <AS8PR08MB58951A0CBE556C313695963291472@AS8PR08MB5895.eurprd08.prod.outlook.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 17 Oct 2024 11:09:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6210

Hi,

On Thu, Oct 17, 2024 at 10:54:41AM +0000, Gyorgy Szing wrote:
> Hi,
> 
> “But optee and optee-client are part of the TS images and configs so there is a link.”
> “I don't see any user being added to the previously used "teeclnt" group. So which non-root users are there? If the users are in Cassini, I have proposed fixes there.”
> I am not saying the TS recipes are perfect and there might be a dependency, which is an error. Except for the OP-TEE SPMC tests SPs which indeed depend on op-tee and xtest.
>
> “What is the proper way to fix this?
> 
> I don't think duplicating optee/tee-supplicant udev rules is the answer.
> I could move optee-client recipe udev rules to a separate binary package
> to enable installing without tee-supplicant.”
> I think a dedicated recipe on which both libts and optee-client depends is one way to fix.

A dedicated recipe is not ok. optee-client upstream provides the udev rule.
A dedicated binary package from optee-client for the udev rule could be
created. The udev rule and matching systemd service (and possibly sysvinit
script) are non-trivial to setup and thus in meta-arm recipe some aspects
were wrong and other Linux distros have even more issues. Thus it's better
to collaborate with upstream when setting them up.

> “But I'd like to see the users and have a test case, preferably in meta-arm.”
> Well, I cannot provide a setup where TS is used without OP-TEE currently, but your config can and will be tested in the CI. Yes, TS only world might still be broken, but the change at least would make a step in the right direction.

I'm still not sure of the right direction. Which recipes and layers have userspace
SW which needs to access /dev/tee* or /dev/teepriv* devices nodes without root
rights in userspace? Where is a test for these recipes or functionality?

The old teeclnt setup was a bit broken. For example tee-supplicant was still
started in systemd service file as root user. Both /dev/tee* and /dev/teepriv*
used the same teeclnt group which was not right according to upstream,
they need to have different groups. Then the systemd service which did not
work in initrd. Etc.

Cheers,

-Mikko

