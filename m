Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 982E4D3C54E
	for <webhook@archiver.kernel.org>; Fri, 18 Oct 2024 05:52:06 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.web11.16318.1729230724961498618
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 17 Oct 2024 22:52:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=Um0G1Cke;
 spf=pass (domain: linaro.org, ip: 209.85.208.174, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2fb58980711so20636901fa.0
        for <meta-arm@lists.yoctoproject.org>; Thu, 17 Oct 2024 22:52:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729230723; x=1729835523; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Id/Qr2WEObxktUCswC4ellAYCMa+HzhoJsLCHE2bNAQ=;
        b=Um0G1CkeTufTEH3Bf3e6iQQiUfxu0BbtpRwheW2J54eiE0GytSLtRraQVVhbXuWmrp
         nXjoWRyKeK1MQsf7hJVaXewLDYyDVk+OblDo6U0J1ypqeWffBnvUny5sAPNRfzbEssRY
         Ud3H8JSy49ol6Y3O5imjT3DaSVg4B8FH6m1rta03z0Yj4AXoF2Vt9AztOpCzC1MzYyA8
         iDnW7Zr8qHUZvlBuwcerW+1LWPANoFPqtF8wPYwh94lc0pztuuFWSiPSNe2ay0YTvUFh
         6ii+AyVFk5MuLk8pYu+73j0LRwSTeThZqjmJOGW/a7xPGs09l2KKHrVFbdc6G3vsxlwX
         hIlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729230723; x=1729835523;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Id/Qr2WEObxktUCswC4ellAYCMa+HzhoJsLCHE2bNAQ=;
        b=NaRbowYRAomLEJ5lBG6Te6+5hdZ8Msghmir5jWUZMk7oAseRiDWbSQ1pebhiFCXFK7
         E6/5XO1eHUd01x5hTuWmTXN9CVmiIW8AYoQ5JvH7wOiftDMYvO/FZ38GaXNE7VNoqOaq
         Uy31tAbvGk3ZB4FCdjwlOtpOIYucW5W9ZqbkB5Gl2PZK6rZ2QOOCfVl/UvrdihF7HBTN
         O8REQxos6fHnVPQ+MPfgkyHR3RhAd6tC/PXIZu1bmOZeFfgMadXdy/8bmbfK2xNCRDOk
         TP4vIMbALQ7BjYDb9vrgySCI0wC+9aItbc4pwsHzX5h0/aJwN/EWWhWrghp11yWXyMKP
         s7sw==
X-Gm-Message-State: AOJu0YxoOTKkZVFYlBIBLDjM+pRkEltELz9bVR5NVgBzD7WBd14v6t/s
	b4WZ2Qm4zqN8yoBbG4HA1KxPV9PazX+rDy7IpLAQ8auwxfiegoDz3txGAWr/MKE=
X-Google-Smtp-Source: AGHT+IGyUKCsTkVyFQc//XCL6tmg1lIo70YLg0E22HMxOtJN7EXD8iZ1iZAQuDiCl/SCuCV2a1WdZw==
X-Received: by 2002:a2e:be0d:0:b0:2fb:70a0:91e7 with SMTP id 38308e7fff4ca-2fb82fc923cmr4725261fa.10.1729230722773;
        Thu, 17 Oct 2024 22:52:02 -0700 (PDT)
Received: from nuoska (85-76-112-112-nat.elisa-mobile.fi. [85.76.112.112])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fb809b21a3sm1281231fa.30.2024.10.17.22.51.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2024 22:52:00 -0700 (PDT)
Date: Fri, 18 Oct 2024 08:51:57 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: anton.antonov@arm.com
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH v3 2/2] trusted-service: remove optee udev and
 group settings
Message-ID: <ZxH3fUZB1Q1ozwSP@nuoska>
References: <ZxDwXeOdfwuCsI_p@nuoska>
 <18350.1729176507648104860@lists.yoctoproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <18350.1729176507648104860@lists.yoctoproject.org>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 18 Oct 2024 05:52:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6214

Hi,

On Thu, Oct 17, 2024 at 07:48:27AM -0700, Anton Antonov via lists.yoctoproject.org wrote:
> On Thu, Oct 17, 2024 at 04:09 AM, Mikko Rapeli wrote:
> 
> > 
> > I'm still not sure of the right direction. Which recipes and layers have
> > userspace
> > SW which needs to access /dev/tee* or /dev/teepriv* devices nodes without
> > root
> > rights in userspace? Where is a test for these recipes or functionality?
> 
> Parsec is the example you're looking for. And parsec oeqa tests would test TS provider if included

Thanks! So meta-security/recipes-parsec/parsec-service/parsec-service_1.4.1.bb
would need to change from "teeclnt" to "tee" group to access /dev/tee* devices
according to optee-client udev rule. I can provide the change when/if this
series gets merged. Same for meta-cassini.

But does the really need to be a separate copy of the optee-client udev rule
for TS setups which need optee but not tee-supplicant from optee-client binary
package?

Cheers,

-Mikko

