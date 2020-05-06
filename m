Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
 by mx.groups.io with SMTP id smtpd.web11.3453.1588780810280744202
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 06 May 2020 09:00:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=Vifs4u5A;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.53, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f53.google.com with SMTP id fb4so970911qvb.7
        for <meta-arm@lists.yoctoproject.org>; Wed, 06 May 2020 09:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=75XkeYTK5xXI5AjBJ/BW9UoEt8CZ2dhzAeFpnSRmkBo=;
        b=Vifs4u5ASvWutdtf2saYmNxOhCzFaWMaEryYmfkg6qvNLEWjHPIpQ32SbJX1ZJ8s/K
         5bhNpy8cWuYORpHGDzVlvjG4yDv8hj7KUcUnMIR4sHgoibh0tkAskn6PGM5JagGr6qaS
         EPEtHtZnqackKwpwspUQdqcIHomGReTd1T5bIBXG3DbUY3dQzh/VH5v7JWEmk/H3Dw4D
         UjxUxIXlpXsDQY5wUMT5PYzt/+GNngyOvf/6mBTN+ac+Dt+InzI+QvDSE3dbOfSDoCGs
         9WC6qzukdmz7JSMb6hen86iW7hJZH5AU7NRSswPQMTd0mRD5W+DUuCNxHWyAFXmfERwB
         kg1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=75XkeYTK5xXI5AjBJ/BW9UoEt8CZ2dhzAeFpnSRmkBo=;
        b=jAaM6pxhpJKiwsg1CigKNLgkVWuLoDVGK+HjqGSv5cg3F+tebE2NwWxKmdv355jgia
         UyfOuhN9Eg36dheG6uGtL5An8p7VcsHJ7c9uGYgETgQB4KAk4+/D3/gv+h/z6rpnjXXK
         QdiHG+nuzhs6+bG3deYxaRDndjHHjeojB2GxxKE8xDXglrIkKtW4PycSr8n1S0JbfFNL
         ykTYS1+04UNNs1GHfpoeM9BlH3McjlEAOBdBXNlOPVxqmad8/wfvVPv3jv23W/q3RK88
         UL5YuU117284pXI9VHr5Q1BhBXUUONB/5jSxlrwU5J+IwV+oTYQ5ezfRUPF0SeFvGhHm
         uZmA==
X-Gm-Message-State: AGi0PubPvOlAFxZypn39jPktrrhK7VbHBoMXdntVjHxpaaF3Geo/WoUR
	OHRDOlhUm0MSnk8CmrIL0toaxDW2l05lmg==
X-Google-Smtp-Source: APiQypLnWyHb68VWLXbFhM5ALcNojbFAKrMrDtd4Ew0ElIOpdq7aAmmod7nlljxmM0D8eJM7AeVKWw==
X-Received: by 2002:a05:6214:1812:: with SMTP id o18mr8895192qvw.64.1588780809178;
        Wed, 06 May 2020 09:00:09 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a664:2e00:1068:4212:6fd:289b])
        by smtp.gmail.com with ESMTPSA id l2sm1978328qkd.57.2020.05.06.09.00.08
        for <meta-arm@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2020 09:00:09 -0700 (PDT)
Date: Wed, 6 May 2020 12:00:07 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH] [arm-autonomy] documentation: Update arm-autonomy-quickstart.md
Message-ID: <20200506160007.GC22996@kudzu.us>
References: <1588253029-52944-1-git-send-email-diego.sueiro@arm.com>
 <1310D4EA-CBD8-477D-B66D-DF34B0A89CA1@arm.com>
MIME-Version: 1.0
In-Reply-To: <1310D4EA-CBD8-477D-B66D-DF34B0A89CA1@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 30, 2020 at 02:25:41PM +0000, Bertrand Marquis wrote:
> 
> 
> > On 30 Apr 2020, at 14:23, Diego Sueiro via lists.yoctoproject.org <diego.sueiro=arm.com@lists.yoctoproject.org> wrote:
> > 
> > Suggest the usage of `bitbake-layers add-layer` command to add all
> > dependant layers.
> > 
> > Change-Id: I1f40f6218b2edc5267e04723c592c16a434f2e82
> > Issue-Id: SCM-986
> > Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
> 
> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Pulled into the master branch.

Thanks,
Jon

> 
> > ---
> > .../documentation/arm-autonomy-quickstart.md        | 21 ++++++++++++++++-----
> > 1 file changed, 16 insertions(+), 5 deletions(-)
> > 
> > diff --git a/meta-arm-autonomy/documentation/arm-autonomy-quickstart.md b/meta-arm-autonomy/documentation/arm-autonomy-quickstart.md
> > index c688600..2a457c1 100644
> > --- a/meta-arm-autonomy/documentation/arm-autonomy-quickstart.md
> > +++ b/meta-arm-autonomy/documentation/arm-autonomy-quickstart.md
> > @@ -45,12 +45,23 @@ Here are the main steps to create an arm-autonomy project:
> >   oe-init-build-env my-project
> >   ```
> > 
> > -2. edit the file `conf/bblayers.conf` and add `meta-arm/meta-arm-autonomy`
> > -  layer to the list of layers of your project. Also add any other layers you
> > +2. Add `meta-arm/meta-arm-autonomy` layer to the list of layers of your
> > +  project in the `conf/bblayers.conf`. Also add any other layers you
> >   might need (for example `meta-arm/meta-arm-bsp` and `meta-arm/meta-arm` to
> > -  use Arm boards like Juno or FVP emulator).
> > +  use Arm boards like Juno or FVP emulator). You can achieve this by using
> > +  the `bitbake-layers add-layer layerdir [layerdir ...]` command.
> >   For example:
> >   ```
> > +  export LAYERDIR_BASE="/home/user/arm-autonomy/"
> > +  bitbake-layers add-layer $LAYERDIR_BASE/meta-poky $LAYERDIR_BASE/meta-yocto-bsp \
> > +   $LAYERDIR_BASE/meta-openembedded/meta-oe $LAYERDIR_BASE/meta-openembedded/meta-python \
> > +   $LAYERDIR_BASE/meta-openembedded/meta-filesystems $LAYERDIR_BASE/meta-openembedded/meta-networking \
> > +   $LAYERDIR_BASE/meta-virtualization $LAYERDIR_BASE/meta-arm/meta-arm-autonomy \
> > +   $LAYERDIR_BASE/meta-arm/meta-arm $LAYERDIR_BASE/meta-arm/meta-arm-bsp
> > +  ```
> > +
> > +  Example of a `conf/bblayers.conf`:
> > +  ```
> >   BBLAYERS ?= " \
> >     /home/user/arm-autonomy/poky/meta \
> >     /home/user/arm-autonomy/poky/meta-poky \
> > @@ -59,10 +70,10 @@ Here are the main steps to create an arm-autonomy project:
> >     /home/user/arm-autonomy/meta-openembedded/meta-python \
> >     /home/user/arm-autonomy/meta-openembedded/meta-filesystems \
> >     /home/user/arm-autonomy/meta-openembedded/meta-networking \
> > -    /home/user/arm-autonomy/meta-arm/meta-arm \
> > -    /home/user/arm-autonomy/meta-arm/meta-arm-bsp \
> >     /home/user/arm-autonomy/meta-virtualization \
> >     /home/user/arm-autonomy/meta-arm/meta-arm-autonomy \
> > +    /home/user/arm-autonomy/meta-arm/meta-arm \
> > +    /home/user/arm-autonomy/meta-arm/meta-arm-bsp \
> >     "
> >   ```
> > 
> > -- 
> > 2.7.4
> > 
> > 
> 

> 

