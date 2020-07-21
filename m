Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
 by mx.groups.io with SMTP id smtpd.web10.19371.1595339314389567715
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 21 Jul 2020 06:48:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=ouKN+Cbo;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.195, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f195.google.com with SMTP id g26so9078600qka.3
        for <meta-arm@lists.yoctoproject.org>; Tue, 21 Jul 2020 06:48:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=LlLr1cF20E3zX8gvIoRvovnHnz+tFEh6Z9v1smdprXo=;
        b=ouKN+Cbo7hVnRYjLn4++3fYzqHMwqooV4AMDWaU9Hg6VIlCwhzS3iD8YnlGTDvcMR5
         nXRlpKLDfcr0EKYID5vEmVdHNF0zYX8zbyI4L4yvG9fCvzpt1D9dd68plsPKf+RfLylZ
         NTPGp3N8QYHL6RgKqJE4Usoq8q3PYf73ybt5a2njBbDSOZ3WapQ7J4TqVA+finhG4j60
         S7+1Dmfv3GJN3S4pOWWJ8/N7OG1WjOTIEkyCJBnrjzobQiDBGdq8OUVQVnXCQaZeY4RM
         zFa+7P/HjD+MZJ9n6pDjQUeCyxhG7+B/L8LQmWJi4ZFjRgWZ+Eh0B+t75hOU1ROsyp/l
         aR6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=LlLr1cF20E3zX8gvIoRvovnHnz+tFEh6Z9v1smdprXo=;
        b=QTImQq0J3kyDXY13/3635Uet0ldCAICf0LHLUc5dl72SfhkKxdSc/OMD6bsV5S2n28
         tZMMMBK8ATkK7lTKQd2PZ4x4Lbo3P0p4L+g8tPpoPx62mJNvhmqDikKqlw3NOnRzAaA2
         EF2fNkXtZ19ZvkHTdjXgYtqNfzYgFgBFkGjdRhYHrJma2ziiCCVEklJ/pLQprwB4tAVt
         Of1RnkkEiuJfjc4Zos6d6t1xb9D0O24tuhOAbBb0lDprcPbZYsdt4ZNzfZ7ufAJAABdv
         9zAeHPF4Y40MN+EpEcDvY+S6165uKwQQdvE3+bl6tOP9MgmLn6BeX8cRSR+xW0o/fwcC
         ekZA==
X-Gm-Message-State: AOAM533Omx6V2uROLrp9oc33Bhpq7L583A5ucHr8V/Qt8RsOZqCFCF8J
	Z6l+zRWHxr7PzsbEEEN5sJiZ3A==
X-Google-Smtp-Source: ABdhPJxlVa51wdpza3yHDKWlczlSLh9gG6M+BTMODv+zIE00R447g6Rr8+AlgM0C/RECdkDJLbAEUg==
X-Received: by 2002:a37:b9c2:: with SMTP id j185mr25724588qkf.274.1595339313562;
        Tue, 21 Jul 2020 06:48:33 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a61a:4700:68b9:7ce6:1e10:7177])
        by smtp.gmail.com with ESMTPSA id 19sm2538144qke.44.2020.07.21.06.48.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2020 06:48:33 -0700 (PDT)
Date: Tue, 21 Jul 2020 09:48:31 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Jon Mason <jon.mason@arm.com>, meta-arm@lists.yoctoproject.org,
	nd@arm.com, Damodar Santhapuri <damodar.santhapuri@arm.com>
Subject: Re: [meta-arm] [PATCH] arm-bsp: u-boot error fixing and file clean-up
Message-ID: <20200721134830.GA30432@kudzu.us>
References: <20200720181735.21132-1-jon.mason@arm.com>
 <1233345f41b84cc472f7dc940bf74f5dd54b9eb7.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <1233345f41b84cc472f7dc940bf74f5dd54b9eb7.camel@linuxfoundation.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 21, 2020 at 09:55:47AM +0100, Richard Purdie wrote:
> On Mon, 2020-07-20 at 14:17 -0400, Jon Mason wrote:
> > This commit fixes the errors while rebasing u-boot src to v2020.07.
> > Additional work necessary to preserve dunfell functionality.
> > Consolidate all of the files into a single inc file and single
> > bbappend
> > file.
> > 
> > Change-Id: I442c843b1fafeb41ea283d2f11393522a48fc9d2
> > Signed-off-by: Damodar Santhapuri <damodar.santhapuri@arm.com>
> > Signed-off-by: Jon Mason <jon.mason@arm.com>
> 
> Thanks, looking forward to green builds!

I'm not sure this gets us to green, but it gets us out of the red for
sure ;-).

It's in master now.  Now Ross can start fixing all the warnings.

Thanks,
Jon

> 
> Cheers,
> 
> Richard
> 

> 

