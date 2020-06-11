Received: from mail-qv1-f67.google.com (mail-qv1-f67.google.com [209.85.219.67])
 by mx.groups.io with SMTP id smtpd.web11.8045.1591884170604424416
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 11 Jun 2020 07:02:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=sLmnONCp;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.67, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f67.google.com with SMTP id y9so2667813qvs.4
        for <meta-arm@lists.yoctoproject.org>; Thu, 11 Jun 2020 07:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=1sek7ceIvYDfl+P43E09+pfq4Ra450quJjFSdTnpDGc=;
        b=sLmnONCpGHphoElVGXyj2L5n26HjyipAgr91DsjVNe06b6BJ8/d+u5h31dzHLDTXnN
         Are6pC6NjgVUcKK4gIFNSetWhE8m50odARbkXvUZqPZ/5LSaHCTp+eVTqZyy03pthNHE
         4HaDbl6iBytfx5N68lb+/I0QJlPn78RvH+QcZyDP3lLQ9PFWVQVyA/vltCbAZXZJa0Oq
         L0qXLy9l+HWzN9i37CwvaND5DMYGtgnIPjLkIaYldWfo+TCm1BZHvfC9yxeTvy8BVKBH
         AOBt7sPJ+hi6L+1eZDz+9SeinJhTAGbJ3ZykS/4nF0P5MN+5JpI1SILQZyCKvDfw1RNb
         enpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=1sek7ceIvYDfl+P43E09+pfq4Ra450quJjFSdTnpDGc=;
        b=OcUP0lEsNLBE328VlwyMKmfgK3Rvp/ESTjpGNZt974c4NZuVRVGIV7fEO5v6GjlFr8
         D0s1Q5RMdfYq3TfMD1m2YmXpuunqkLfbb+X/sa7/PRO2inNCmlQnJgiXHqBAgPYoC+2a
         dsWiyPBZi31aF9NkJboG3hNC9sfSdVwsAO/CSHOO+UDD0NnKjXVZky+kLbitDvm8+Zmv
         +5jsJRItZfZcbYRcDJBaYc+rQzISmeucO9g6DQzd6ZOS5POxQyRyUZC9sqca1RSGgBgS
         im0qpARELTSdbXqvPhe3a5yWNJaPZDBcyqcf/4p1qdstz7TIyUyWJ+gSBESaW6UBphQ4
         IJRg==
X-Gm-Message-State: AOAM5308aY4dlPjAYvPD9znvGth2NCzH/OcihtkkR0f9APl7YAsjzmej
	7xgmcTx3yxj0ElO/xTqOP1Awi0XKQaU=
X-Google-Smtp-Source: ABdhPJyZrulZztkllZ5IcRUbzSgpx5ap/IgyyVLNrzJ2FnWoJqZ2TIdYkwiLT/oFz3YYmP0nYacDGA==
X-Received: by 2002:ad4:56e9:: with SMTP id cr9mr7997147qvb.10.1591884169622;
        Thu, 11 Jun 2020 07:02:49 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a61a:4700:e01b:52c7:6d78:8385])
        by smtp.gmail.com with ESMTPSA id 5sm2263984qkr.9.2020.06.11.07.02.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2020 07:02:49 -0700 (PDT)
Date: Thu, 11 Jun 2020 10:02:47 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Bertrand Marquis <bertrand.marquis@arm.com>
Cc: Diego Sueiro <Diego.Sueiro@arm.com>,
	"meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>,
	nd <nd@arm.com>
Subject: Re: [meta-arm] [PATCH] arm-autonomy, xenguest-network-bridge: Set bridge members per machine
Message-ID: <20200611140247.GB17598@kudzu.us>
References: <1591861655-35452-1-git-send-email-diego.sueiro@arm.com>
 <5DAA03B1-3E78-4393-A538-E2A73C0F3801@arm.com>
MIME-Version: 1.0
In-Reply-To: <5DAA03B1-3E78-4393-A538-E2A73C0F3801@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 11, 2020 at 07:55:05AM +0000, Bertrand Marquis wrote:
> 
> 
> > On 11 Jun 2020, at 08:47, Diego Sueiro via lists.yoctoproject.org <diego.sueiro=arm.com@lists.yoctoproject.org> wrote:
> > 
> > By default, XENGUEST_NETWORK_BRIDGE_MEMBERS should be empty and only be
> > set per machine.
> > 
> > Change-Id: I67c56847eb785279c28757a6052f092c838babe0
> > Issue-Id: SCM-995
> > Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Applied to the master branch.

Thanks,
Jon

> 
> > ---
> > .../recipes-extended/xenguest/xenguest-network-bridge.bbappend    | 8 ++++++++
> > .../recipes-extended/xenguest/xenguest-network-bridge.bb          | 6 +++++-
> > 2 files changed, 13 insertions(+), 1 deletion(-)
> > 
> > diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xenguest/xenguest-network-bridge.bbappend b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xenguest/xenguest-network-bridge.bbappend
> > index dc84921..de88cce 100644
> > --- a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xenguest/xenguest-network-bridge.bbappend
> > +++ b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xenguest/xenguest-network-bridge.bbappend
> > @@ -1,2 +1,10 @@
> > +XENGUEST_NETWORK_BRIDGE_MEMBERS_n1sdp ?= "eth0"
> > +
> > +XENGUEST_NETWORK_BRIDGE_MEMBERS_fvp-base ?= "eth0"
> > +
> > +XENGUEST_NETWORK_BRIDGE_MEMBERS_foundation-armv8 ?= "eth0"
> > +
> > +XENGUEST_NETWORK_BRIDGE_MEMBERS_gem5-arm64 ?= "eth0"
> > +
> > # Juno board has 2 network interfaces, add both of them to the bridge
> > XENGUEST_NETWORK_BRIDGE_MEMBERS_juno ?= "eth0 eth1"
> > diff --git a/meta-arm-autonomy/recipes-extended/xenguest/xenguest-network-bridge.bb b/meta-arm-autonomy/recipes-extended/xenguest/xenguest-network-bridge.bb
> > index babd694..c6c2242 100644
> > --- a/meta-arm-autonomy/recipes-extended/xenguest/xenguest-network-bridge.bb
> > +++ b/meta-arm-autonomy/recipes-extended/xenguest/xenguest-network-bridge.bb
> > @@ -9,7 +9,11 @@ S = "${WORKDIR}"
> > # Please refer to documentation/xenguest-network-bridge.md for documentation on
> > # those parameters
> > XENGUEST_NETWORK_BRIDGE_NAME ?= "xenbr0"
> > -XENGUEST_NETWORK_BRIDGE_MEMBERS ?= "eth0"
> > +
> > +# The XENGUEST_NETWORK_BRIDGE_MEMBERS should be set in a machine.conf
> > +# or bbappend file.
> > +#XENGUEST_NETWORK_BRIDGE_MEMBERS ?= "eth0"
> > +
> > XENGUEST_NETWORK_BRIDGE_CONFIG ?= "xenguest-network-bridge-dhcp.cfg.in"
> > 
> > SRC_URI = " \
> > -- 
> > 2.7.4
> > 
> > 
> 

> 

