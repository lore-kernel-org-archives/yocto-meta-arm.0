Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com [209.85.160.194])
 by mx.groups.io with SMTP id smtpd.web11.10768.1588341806928073224
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 01 May 2020 07:03:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=i9L/WiRq;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.194, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f194.google.com with SMTP id h26so7934644qtu.8
        for <meta-arm@lists.yoctoproject.org>; Fri, 01 May 2020 07:03:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=qye1hM/M2YXORahbjrgC5WsaHQ21LUkWNG11ND1pcFs=;
        b=i9L/WiRqzSai9WjrxYOr9o0aIWnkAliZ8Rv+wJL6T2mG7uco4AmjJGFq/EsSkaqaVg
         HH/P3XCE2jty4y+1g1fakPPEUsurv2DYpdXw+2rngDozzKCQSO5OXsDNbZV1A6IZ2m+h
         RiLfHSv5vaQV6+CwDANyo3wGpVbcQSVYfEGE+Xs46GZyyt69FQQWg5QJyktVVH3NhS0B
         L4ir805wHCUuMDtEi92B2HF1CBVmjQLI5cjd1dn6z+0HYun0EVDaVsBZrd3MIn4Xnwoh
         N/4DdjE/iPnr7YLnZNu6Si8tgF4WM48nnduDqnSzBTcZlg2elYHJ9d5TAju4AjO78rGo
         k9Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=qye1hM/M2YXORahbjrgC5WsaHQ21LUkWNG11ND1pcFs=;
        b=EB6UTvQaXcVjX54jyUXGwmh3jS0TU3KW56DnrUSGe3skXQmi2jo+h5f2sFEZ/iHUL5
         jRvMdcFfvTIDmnNJr9LTpp6JiBIjroiHxYd2zZVSWEGkFa/NXHUu9VFZJSzIb4vfCSAz
         lFo74RzZmmwiCNqXbLZWBmHhcqlFi7XmpheriISh8CPBferc3RJkCNlhAypyV1MBNed2
         xtNlhFX3ZZCYRa5zkuoeHe8eIsb1a6duwhPt+b+/upB9aW1i+mm2mULi2wHFtbjtLsXO
         9P7NYAO11VPnfZkDBi0icx0FPQY5t2znIg+tZA8ndyhWCL46LBLSxnFHjQe/vT8UKJju
         4Oew==
X-Gm-Message-State: AGi0PuYPa2FPRmZa2+P8WHJPxCmwGjNjICbd+0pV45s5IaK1SS2kAmfi
	dH446vkVMAQM9l9jNG+ydQDL4RSqS1rcQA==
X-Google-Smtp-Source: APiQypIQNNQN/3gAHH+2MR9aV6AJBBBEXOPyXHdwOXUNl5PDSaNMRfkhvjvHpjcMULQcYBiKMii7RA==
X-Received: by 2002:ac8:6d2c:: with SMTP id r12mr3977068qtu.355.1588341797299;
        Fri, 01 May 2020 07:03:17 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a664:2e00:bca5:cc07:46bf:ecff])
        by smtp.gmail.com with ESMTPSA id 127sm1438259qkj.59.2020.05.01.07.03.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2020 07:03:16 -0700 (PDT)
Date: Fri, 1 May 2020 10:03:15 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: meta-arm@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>, nd <nd@arm.com>
Subject: Re: [meta-arm] [PATCH 1/4] tcmode-external-arm: drop unnecessary CPPFLAGS and LDFLAGS adjustments
Message-ID: <20200501140314.GC13726@kudzu.us>
References: <1588219828-34791-1-git-send-email-denis@denix.org>
 <AM0PR08MB398746628A1C3F2836A3FAEF92AB0@AM0PR08MB3987.eurprd08.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <AM0PR08MB398746628A1C3F2836A3FAEF92AB0@AM0PR08MB3987.eurprd08.prod.outlook.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, May 01, 2020 at 06:46:08AM +0000, Diego Sueiro wrote:
> > -----Original Message-----
> > From: meta-arm@lists.yoctoproject.org <meta-arm@lists.yoctoproject.org>
> > On Behalf Of Denys Dmytriyenko via lists.yoctoproject.org
> > Sent: 30 April 2020 05:10
> > To: meta-arm@lists.yoctoproject.org
> > Cc: Denys Dmytriyenko <denys@ti.com>
> > Subject: [meta-arm] [PATCH 1/4] tcmode-external-arm: drop unnecessary
> > CPPFLAGS and LDFLAGS adjustments
> > 
> > From: Denys Dmytriyenko <denys@ti.com>
> > 
> > These were there from the very beginning and they were used as crutches to
> > prop up the build by pointing directly to the external toolchain location, in
> > case early versions of external-arm-toolchain missed staging/packaging
> > something from there.
> > 
> > First of all, it is unnecessary to adjust CPPFLAGS and LDFLAGS in this way, as
> > external-arm-toolchain is supposed to stage everything needed from the
> > toolchain in internal sysroot.
> > 
> > And second, these settings can be harmful and conflict with component's
> > own CPPFLAGS/LDFLAGS. For example, OpenCV 4.1 fails to link internal
> > libraries because of incorrect -Wl,-rpath-link passed down the build.
> > 
> > After dropping these, I was able to verify that everything still builds, including
> > BSP, Wayland/Weston, Qt5, gstreamer, OpenCV, etc for Aarch64 and Armv7a
> > platforms.
> > 
> > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> 
> Reviewed-by: Diego Sueiro <diego.sueiro@arm.com>

Series (except the patch you said to ignore) pulled into the master branch.

Thanks,
Jon


> 
> > ---
> >  meta-arm-toolchain/conf/distro/include/tcmode-external-arm.inc | 2 --
> >  1 file changed, 2 deletions(-)
> > 
> > diff --git a/meta-arm-toolchain/conf/distro/include/tcmode-external-arm.inc
> > b/meta-arm-toolchain/conf/distro/include/tcmode-external-arm.inc
> > index 8ddaf53..9171380 100644
> > --- a/meta-arm-toolchain/conf/distro/include/tcmode-external-arm.inc
> > +++ b/meta-arm-toolchain/conf/distro/include/tcmode-external-arm.inc
> > @@ -44,8 +44,6 @@ PREFERRED_PROVIDER_glibc-thread-db = "external-
> > arm-toolchain"
> >  PREFERRED_PROVIDER_glibc-mtrace = "external-arm-toolchain"
> >  PREFERRED_PROVIDER_libc-mtrace = "external-arm-toolchain"
> >  PREFERRED_PROVIDER_virtual/linux-libc-headers = "external-arm-toolchain"
> > -TARGET_CPPFLAGS_prepend = " -
> > isystem${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/include "
> > -TARGET_LDFLAGS_prepend = " -
> > L${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/lib -Wl,-rpath-
> > link,${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/lib "
> > 
> >  TOOLCHAIN_OPTIONS = " --sysroot=${STAGING_DIR_HOST}"
> > 
> > --
> > 2.7.4
> 

> 

