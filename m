Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
 by mx.groups.io with SMTP id smtpd.web11.19490.1591966844290366826
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 12 Jun 2020 06:00:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=SMQqRQFm;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.195, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f195.google.com with SMTP id g28so8851724qkl.0
        for <meta-arm@lists.yoctoproject.org>; Fri, 12 Jun 2020 06:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=XFiB4dHsDQ5Qa1VzQJuG7g54LGOYKJ5fcn8JkUCaLiM=;
        b=SMQqRQFmbrqrnayNGqhXeCoSr8TrABsVYicPiUGZgXodfAeFGp8fjsfcsGC93I5TY9
         mbYXlUjpsudNfY5Jr0jhWE6MQb4XkoY8kI8FAyvVuqMAkHlLfG6If1x0LgVRBZL5pnQu
         oq+ayDcVQKIV8CJPL9Hla87Dp9Haxxej6syKba/VWwADjeqdwqtNhP4V9j4AVMzDsehY
         qyzNZovf2rVroM59wObepCapanCMcC+rdmmefy8zsKT+aCpJWa3cuEGujTgD1s3QYGA3
         ZWsXWnf1rK7x5qJXI89fuo54MxiaVpnBVpqQN/Y8OhPOyKhM+aeBmntxw9IkS4HEyIbx
         b5Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=XFiB4dHsDQ5Qa1VzQJuG7g54LGOYKJ5fcn8JkUCaLiM=;
        b=QzehUpQEJgTEtrR24Nvs3X8Ou4MX7ReL0IXlWg8Scgi8pbFy34jXSBmGCoA41ufkjO
         fpCUDO4AAyStdQkfF71zs13jGvuW+RuSigQB2F2cFyOOZeALfmfC8aZJn+WuazI43k1s
         4kCY1oG7gAlJE/K41Q5UulfO/pfMjUGkTGfGLe/HrN6oj75r1UZU+/jae9AUgThmu2x4
         mYbmZ+KfpT619wCVFhHmTb1LfYNFhn/QUTL8B9RJ3XjCOXF5L2PftiZPDSBDux31AC9V
         s71egXPRXrYx6/GOV9P2GV61ngj77R6Q6sJow+PcjvHHMslK1XbaU1DFO+jzNMMAN3cr
         eRhQ==
X-Gm-Message-State: AOAM530KLQLi0gazVMnnLC8UJNztEr3WPZ63+d0tYu3v2Ir3NwTSpt9J
	Ptz+p0Mr4YDrwbw1VLhCW7ERUQ==
X-Google-Smtp-Source: ABdhPJxgcIl8ooEyfZu3HH0T09myALVDBBEdXQptekZXtvBwAV+HtZmkGWaPdcxpE8aSmRUsG36vQQ==
X-Received: by 2002:a37:9684:: with SMTP id y126mr2853761qkd.348.1591966843274;
        Fri, 12 Jun 2020 06:00:43 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a61a:4700:d487:8053:cdd4:dbb0])
        by smtp.gmail.com with ESMTPSA id i71sm4370485qke.75.2020.06.12.06.00.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2020 06:00:43 -0700 (PDT)
Date: Fri, 12 Jun 2020 09:00:41 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Diego Sueiro <diego.sueiro@arm.com>
Cc: meta-arm@lists.yoctoproject.org, Joshua Watt <jpewhacker@gmail.com>,
	Denys Dmytriyenko <denis@denix.org>
Subject: Re: [meta-arm] [PATCH] trusted-firmware-a: fiptool build using BUILD_CFLAGS and BUILD_LDFLAGS
Message-ID: <20200612130041.GC14746@kudzu.us>
References: <20200612124503.GB14746@kudzu.us>
 <14107.1591966447946904888@lists.yoctoproject.org>
MIME-Version: 1.0
In-Reply-To: <14107.1591966447946904888@lists.yoctoproject.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jun 12, 2020 at 05:54:07AM -0700, Diego Sueiro wrote:
> On Fri, Jun 12, 2020 at 01:45 PM, Jon Mason wrote:
> 
> >
> > On Thu, Jun 11, 2020 at 03:17:04PM +0100, Diego Sueiro wrote:
> > > Since the TF-A fiptool is native tool we should be using the
> > > BUILD_CFLAGS and BUILD_LDFLAGS flags to proper build and execute it.
> > > 
> > > Change-Id: I9634604dbc42ba7da85d9b9449f1ed94ecb38df2
> > > Issue-Id: SCM-888
> > > Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
> > 
> > Pulled into master.
> 
> Thanks.
> 
> Could you please backport it to dunfell?

Yes, this seems like a good bug fix.  I just want to make sure that
Denys and Joshua are aware, since it might break them.

Thanks,
Jon


> 

