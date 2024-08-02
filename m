Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82931C3DA4A
	for <webhook@archiver.kernel.org>; Fri,  2 Aug 2024 12:27:43 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web10.91661.1722601653870655505
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 02 Aug 2024 05:27:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=G6j69CcD;
 spf=pass (domain: linaro.org, ip: 209.85.167.46, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-52efba36802so13217594e87.2
        for <meta-arm@lists.yoctoproject.org>; Fri, 02 Aug 2024 05:27:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722601652; x=1723206452; darn=lists.yoctoproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dChIH5MjGicHILbDGhkchdIxUbXzrOZffcc2pi9dn4Y=;
        b=G6j69CcDAbYVEVlGpsNtdDAmp8LQ2ISRPaUYvN7m/kXPhFdBUnfffymjlLBQpev80O
         H1lx+SqjFPCHfhnDOdsNCqgrW1WIqDY8I9QWfsdk+yQoJ1ATGV4fWhGJmUQmtzwN1mJ6
         OP6K3Ockt8AkBzJYKGh8eHG1LR5mraFCYAkvjidiYzAMByaB79OFV+K8mmRokQSf40sz
         ipiFbUvBPsZg2Q81n5mbZrZpDMcCbAbhRcIiPgcIDz4OfSopB/Av2ZLa7+F9d7A/fAzi
         IdoQWPUkojWK6xgXey2X0n1/bvl9l7e7XIZOzkt67bfz+ztRWNtn8nFG7NyZoI62v60E
         U4Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722601652; x=1723206452;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dChIH5MjGicHILbDGhkchdIxUbXzrOZffcc2pi9dn4Y=;
        b=WumoYmHVyOqiyXdc3PhwbINRdt9G++r7nVBzOEShrF7sCIC70nTBSz8ddqRG4N2KcP
         oBF0KN/IgIRcQhYhqABI/R+sTA/edhyhMxOeqqUd6ENb7tw7I5D8OYtvBgtJNGkX6k/H
         xn4X60bzaBvxMw6ekDh+rrXznwSqHl4OvJqH4GcrY78kz5yPPUidtfxvrI5TVGBgqrz9
         9EDAH184p7Mpbyry0qvIFLRe317g+o/c75sQv2QPYiVfhehiYDdyQ06MnPDf3nObkk8N
         j061g+A1TmmxHu8a/MtxA+NK3S9gwkyp35Qd9bGaV9KEaalYXJrnLItJBPj4aNZAw7S7
         K9AA==
X-Gm-Message-State: AOJu0Yy5lKqtChUnRyyo+EiaOG4B3qB38GUr+w1rrGv7ZoJxUYypaR92
	GUX7gjAt+6+6/+augh2hpgFpCeOujMY+SuCmu0w8w1g0n3fugEzqVXuOk+StAqo=
X-Google-Smtp-Source: AGHT+IEVGfH9ECEx6LnbnPQIPt9SzeKPHFxP9AZvPhR565ePGow58a48iQuBNbMjwKluNZPpZzDPEA==
X-Received: by 2002:a05:6512:2805:b0:52c:898b:a180 with SMTP id 2adb3069b0e04-530bb3667ddmr2394586e87.12.1722601651836;
        Fri, 02 Aug 2024 05:27:31 -0700 (PDT)
Received: from nuoska (87-100-245-199.bb.dnainternet.fi. [87.100.245.199])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-530bba2a0dasm213085e87.121.2024.08.02.05.27.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Aug 2024 05:27:30 -0700 (PDT)
Date: Fri, 2 Aug 2024 15:27:29 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Jon Mason <jdmason@kudzu.us>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [PATCH][master-next] optee-os: fix buildpaths QA failure on
 corstone1000
Message-ID: <ZqzQsZ-6tZCCM0nG@nuoska>
References: <20240801090558.43415-1-mikko.rapeli@linaro.org>
 <Zqul7Gx37jYcgI0o@kudzu.us>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Zqul7Gx37jYcgI0o@kudzu.us>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 02 Aug 2024 12:27:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5946

Hi,

On Thu, Aug 01, 2024 at 11:12:44AM -0400, Jon Mason wrote:
> On Thu, Aug 01, 2024 at 12:05:58PM +0300, Mikko Rapeli wrote:
> > Patch submitted upstream:
> > 
> > https://github.com/OP-TEE/optee_os/pull/6974
> > 
> > Fixes:
> > 
> > https://gitlab.com/jonmason00/meta-arm/-/jobs/7472950159
> > 
> > ERROR: mc:firmware:optee-os-4.2.0-r0 do_package_qa: QA Issue: File /lib/firmware/tee.elf in package optee-os contains reference to TMPDIR [buildpaths]
> > 
> > Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> 
> This patch fixes the issue and CI on master-next is now green (but I
> had to run this internally since my externally visible CI is behind).
> However, after looking at the progress being made in https://github.com/OP-TEE/optee_os/pull/6974
> It might be best to wait on the solution in there and backport that.
> Given the responsiveness of J�r�me Forissier and yourself, I expect it
> should happen in the next few hours.

Took a bit longer but v2 is now out with patches approved and merged
upstream.

Thanks!

-Mikko

