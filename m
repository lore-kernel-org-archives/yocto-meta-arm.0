Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F651C369DC
	for <webhook@archiver.kernel.org>; Wed,  7 May 2025 06:34:01 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web11.2136.1746599637070744874
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 06 May 2025 23:33:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=CFU+09ho;
 spf=pass (domain: linaro.org, ip: 209.85.208.177, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-3105ef2a06cso61882021fa.2
        for <meta-arm@lists.yoctoproject.org>; Tue, 06 May 2025 23:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746599635; x=1747204435; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=C7DtxFIhvg0E0gKFYEOqHvFyF/dsxmUIGsyZzvqoX3M=;
        b=CFU+09horkrB7aCPULMSEXMtUN7NoSqVokKYSCCaLUckC4z1fMMdN+aKnAetTug+Ze
         UpiBj6bcpVez3gu95vY3lBThRKTe2AQrovneMeZj6UyXutmP0bIZ1AVWqIF4mnYpuiXD
         HWkZZsuI6QaTGdPN5JEJmaJlEFl5eYao3IxaiJHZxBR4wtSm53UXx9OrlabK4AisXUqc
         rjTJmQu5JW90wEnmnuKftc9SjRiupb7sd/8fJj9Ds2vvumziHPbA8YP8mj0bNg+ettyI
         vjdhJ7kUu+GLDO/S0kWSp3/k6SQRVsI16RqymeUfHQkigy3vm2zSyjWeS/TrScCA1Opk
         XirQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746599635; x=1747204435;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C7DtxFIhvg0E0gKFYEOqHvFyF/dsxmUIGsyZzvqoX3M=;
        b=q5dJjs+yYBp6FIZmAGbqGuAA9AdnyziTXKcucPdaSO4Zu5Troucjjig8GAzBYJ3akC
         s/33J8nz0aUgVVMZ8X5vZGjC4DAEH3D5PYjS3XbPvky224/HjiS3Xd/fnGn9sJmK0MZy
         9QHY6h/dpmX2XuWwPXM+KPpwBPts2jAbkTiAoXhFwQnxQtQ42DfcgDIDAuCRc/gBpv22
         u/mcNFSlOoyTvZtqi5EGwuKu0+DGLN8I9qd3AhKLi4ZREk8QYlddXd/pxVVkUiy+mVKi
         pdkK8fcV/R2rUvGkkgaMIkHr+CUXL2F8HBt6EBhbE286LEbsUln52OzsbdB71GmqMXIz
         ukSg==
X-Gm-Message-State: AOJu0Ywk2B2qlc00J7lcxmyGfr0sCLbXnxmg9lpM248oPAZwBrvdeLqn
	MvBHba/83lsAdR79OJG/8wEzIcfYMCzAXxDFTiO/iVGb7NIKh8I0NSjnoTOJTl7ou3+miqhbZ2e
	t8NU=
X-Gm-Gg: ASbGncvlciqb3Bj4FUAVVO5S4vH2r3LSj11039I+x824B/u3xrrPF/RMXY2L16y9dvr
	L9kDv+FLPKkobVAosKT6BhKuorBImiS67ziqablOIsnlra4BEa0strdiMyz5H5XAP7KzzFJ1DlI
	oI/G4J86V3+sLenoodMeYwTDQNJwsx6GzDWmtlt1yE39hanVIrtCtdYi/OIHEoCd0lYal/HrE06
	wDAQ5AAjv74DqxRwj39ZsaVtnOs1FLtkgL2m9OW3R5b2R0lpdMet8kDLUmM+RdYzGvg6aanpKAj
	QdTS+WLWzqXzUsXLUYECniGBLvEm5uYq91mMBr8wjFUJhEIUDYx8aOP0a7V/jiXIYP/bVXIE5A=
	=
X-Google-Smtp-Source: AGHT+IGSsSKptb7K2OcKG76ryJypOJdQJh00Zdl1vo+U5NtQWKuJ049yg4oiYdZ42V7S1k5RpOf0dg==
X-Received: by 2002:a05:651c:220a:b0:30b:fd7a:22e9 with SMTP id 38308e7fff4ca-326ad17dae4mr5492931fa.13.1746599635057;
        Tue, 06 May 2025 23:33:55 -0700 (PDT)
Received: from nuoska (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3202b188ae3sm22273511fa.112.2025.05.06.23.33.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 23:33:54 -0700 (PDT)
Date: Wed, 7 May 2025 09:33:53 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Denys Dmytriyenko <denis@denix.org>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH] optee-test: disable -Werror
Message-ID: <aBr-0VENtYuFBHkU@nuoska>
References: <20250506133349.1139953-1-mikko.rapeli@linaro.org>
 <20250507015750.GI18383@denix.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250507015750.GI18383@denix.org>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 07 May 2025 06:34:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6491

Hi,

On Tue, May 06, 2025 at 09:57:50PM -0400, Denys Dmytriyenko wrote:
> FTR, I have an alternative fix for this:
> 
> https://patchwork.yoctoproject.org/project/arm/patch/20250507014107.1686356-1-denis@denix.org/

Thanks, yours is a better fix.

-Werror may bring more trouble later on, if anyone tries clang for example,
so I don't like it as a default.

Cheers,

-Mikko

