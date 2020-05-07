Received: from mail-qv1-f68.google.com (mail-qv1-f68.google.com [209.85.219.68])
 by mx.groups.io with SMTP id smtpd.web10.2354.1588879990158345229
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 07 May 2020 12:33:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=BDCsM7si;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.68, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f68.google.com with SMTP id t8so3279580qvw.5
        for <meta-arm@lists.yoctoproject.org>; Thu, 07 May 2020 12:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=a5q0Qv/B68QH6MviJAWE0YOiKA0IXxZxouzf+WMl92o=;
        b=BDCsM7siphF3cgg759tCndxMIfSuRsfOez0YhcHVu8xwXyHhIAvNGUMXUZq0BYI+P/
         ERo5zKacg+Wi3ctfrDXMMQlztMvC47oDLUWUe0elKxMSCYsaiqFO9M6cHdnsAFW9eoAB
         d6kwlX1va6gCR7eK9DcpofWSVPa/vPcc1aetpWPhpFaX6QUaJbPaTIH2E7AG5YR5SkYV
         AxwxL73NiPJFw9atTo75rcpjka9n/Mnjkx0K58+k7sKkk47zj8aMaCGWXtlkRTtBne53
         AAjUnd2oUwIE8vjQv4wbI959n6WtgxV0jROnqJPcH/Kw0+PrwDQ0fXwJ2DMQ+lBmp5Vx
         rxvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=a5q0Qv/B68QH6MviJAWE0YOiKA0IXxZxouzf+WMl92o=;
        b=iwFVlRQcrcmqKhbCqhK5UpF+E4eWjndPm2J4bOf+DzbLbOBt7FuflIyEL+bOXtt4q6
         l7x8qpnlI9943GSkvAlwS41gzd1O42flyYfNepqBvBBbhVVY1p9ii4OcXyZgzanNjgbm
         4wt2+Gbarv07u/9ZiJwicniynnznloAJMNJJVuSaztzWR08JeZAqL0tJL3nBDdfJ/k4g
         Hi39lbeLeW8jS5E47y/SMCVVr/eRbvN5vBzkzFVQ5nyGZ0u6gjd/ulP1fO0Y/9bSgHMv
         9XjLXUH8kQbXepgGGp0OGGW1i9KmJi1U6JzGowoB0KL3m0JetHN9igRhDw6VHAErnFlu
         Akmw==
X-Gm-Message-State: AGi0PuZkqIIWnfzu0WHVEK627eHVNtIIIGuLJnVwmwM9bABbQa+mRl9T
	1RILbJccWMTnwo8iNWDjUvTbWVgzUX4PRw==
X-Google-Smtp-Source: APiQypJiRGjxPVnW8NcAcAuanTNJAoQzaJxJdrkKvosCfJJVb0zytvO5mX+k7Ddde9OYp9b0z/t08w==
X-Received: by 2002:a0c:c38e:: with SMTP id o14mr15481771qvi.232.1588879986453;
        Thu, 07 May 2020 12:33:06 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a664:2e00:d1e6:bc5d:97fe:f5af])
        by smtp.gmail.com with ESMTPSA id s8sm5274768qtb.0.2020.05.07.12.33.05
        for <meta-arm@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2020 12:33:05 -0700 (PDT)
Date: Thu, 7 May 2020 15:33:04 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH] meta-arm-bsp: Update gem5 and switch to python3
Message-ID: <20200507193303.GB1726@kudzu.us>
References: <20200501134650.3707-1-bertrand.marquis@arm.com>
 <20200506155642.GA22996@kudzu.us>
 <DA38ACAC-A14B-45FB-9A12-4C78BBB7F153@arm.com>
 <D9520898-E03E-4271-B73D-6E3B54F5B8C9@arm.com>
MIME-Version: 1.0
In-Reply-To: <D9520898-E03E-4271-B73D-6E3B54F5B8C9@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Wed, May 06, 2020 at 04:38:51PM +0000, Bertrand Marquis wrote:
> 
> 
> > On 6 May 2020, at 17:02, Bertrand Marquis <bertrand.marquis@arm.com> wrote:
> > 
> > 
> > 
> >> On 6 May 2020, at 16:56, Jon Mason via lists.yoctoproject.org <jdmason=kudzu.us@lists.yoctoproject.org> wrote:
> >> 
> >> On Fri, May 01, 2020 at 02:46:50PM +0100, Bertrand Marquis wrote:
> >>> This patch includes several fixes for gem5-aarch64
> >>> - Switch to a new version of gem5 supporting python3 and use python3 to
> >>> build it.
> >>> We use a version in develop branch of gem5 for now and we will have to
> >>> switch to release 20 once it is released mid of may.
> >>> - Remove scons python2 recipes which were used before by gem5 as a
> >>> workaround until gem5 was updated to support python3
> >>> - make gem5-aarch64-bootloader only compatible with gem5-aarch64
> >>> - remove unnecessary FILESEXTRAPATHS_prepend in gem5-aarch64-bootloader
> >> 
> >> 
> >> 
> >> I'm seeing an error when compiling this, which I wasn't seeing before.
> >> 
> >> 
> >> 
> >> ERROR: gem5-aarch64-native-gitAUTOINC+0c7f131ed2-r0 do_compile: scons build execution failed.
> >> ERROR: gem5-aarch64-native-gitAUTOINC+0c7f131ed2-r0 do_compile: Execution of '/home/jdm/yocto/poky/build/tmp/work/x86_64-linux/gem5-aarch64-native/gitAUTOINC+0c7f131ed2-r0/temp/run.do_compile.5490' failed with exit code 1:
> >> scons: Reading SConscript files ...
> >> TypeError: object of type 'map' has no len():
> >>  File "/home/jdm/yocto/poky/build/tmp/work/x86_64-linux/gem5-aarch64-native/gitAUTOINC+0c7f131ed2-r0/git/SConstruct", line 405:
> >>    compareVersions(gcc_version, '8.1') < 0:
> >>  File "/home/jdm/yocto/poky/build/tmp/work/x86_64-linux/gem5-aarch64-native/gitAUTOINC+0c7f131ed2-r0/git/src/python/m5/util/__init__.py", line 139:
> >>    if len(v1) < len(v2): return -1
> >> WARNING: exit code 1 from a shell command.
> >> 
> >> ERROR: Logfile of failure stored in: /home/jdm/yocto/poky/build/tmp/work/x86_64-linux/gem5-aarch64-native/gitAUTOINC+0c7f131ed2-r0/temp/log.do_compile.5490
> >> Log data follows:
> >> | DEBUG: Executing shell function do_compile
> >> | scons: Reading SConscript files ...
> >> | TypeError: object of type 'map' has no len():
> >> |   File "/home/jdm/yocto/poky/build/tmp/work/x86_64-linux/gem5-aarch64-native/gitAUTOINC+0c7f131ed2-r0/git/SConstruct", line 405:
> >> |     compareVersions(gcc_version, '8.1') < 0:
> >> |   File "/home/jdm/yocto/poky/build/tmp/work/x86_64-linux/gem5-aarch64-native/gitAUTOINC+0c7f131ed2-r0/git/src/python/m5/util/__init__.py", line 139:
> >> |     if len(v1) < len(v2): return -1
> >> | ERROR: scons build execution failed.
> >> | WARNING: exit code 1 from a shell command.
> >> | ERROR: Execution of '/home/jdm/yocto/poky/build/tmp/work/x86_64-linux/gem5-aarch64-native/gitAUTOINC+0c7f131ed2-r0/temp/run.do_compile.5490' failed with exit code 1:
> >> | scons: Reading SConscript files ...
> >> | TypeError: object of type 'map' has no len():
> >> |   File "/home/jdm/yocto/poky/build/tmp/work/x86_64-linux/gem5-aarch64-native/gitAUTOINC+0c7f131ed2-r0/git/SConstruct", line 405:
> >> |     compareVersions(gcc_version, '8.1') < 0:
> >> |   File "/home/jdm/yocto/poky/build/tmp/work/x86_64-linux/gem5-aarch64-native/gitAUTOINC+0c7f131ed2-r0/git/src/python/m5/util/__init__.py", line 139:
> >> |     if len(v1) < len(v2): return -1
> >> | WARNING: exit code 1 from a shell command.
> >> |
> >> ERROR: Task (/home/jdm/yocto/meta-arm/meta-arm-bsp/recipes-devtools/gem5/gem5-aarch64-native_git.bb:do_compile) failed with exit code ‘1’
> >> 
> >> 
> > 
> > Could you provide more information on your testing environment ?
> > Which version of Yocto, what configuration ?
> > 
> > This was compiling properly last time I tried it with Zeus.
> 
> To give more detail on my setup:
> 
> - meta-openembedded and poky version zeus up to date
> 
> - meta-arm with master status including everything you merged today
> 
> - bblayer.conf with the following layers:
> poky/meta \
> poky/meta-poky \
> poky/meta-yocto-bsp \
> meta-openembedded/meta-oe \
> meta-openembedded/meta-python \
> meta-arm/meta-arm \
> meta-arm/meta-arm-bsp
> - local.conf with:
> MACHINE ?= "gem5-arm64”
> 
> - bitbake core-image-minimal
> 
> Could you give more information on how you generate your error because I could not reproduce it ?


From a new poky git repo, on the zeus branch.

git clean -dffx
source oe-init-build-env > /dev/null
bitbake-layers layerindex-fetch meta-oe meta-python
bitbake-layers layerindex-fetch -b master meta-arm meta-arm-toolchain
bitbake-layers add-layer ~/yocto/meta-arm/meta-arm-bsp
echo -e '\nDL_DIR ?= "/yocto/downloads"\nBB_GENERATE_MIRROR_TARBALLS = "1"\nSSTATE_DIR ?= "/yocto/sstate-cache"' >> conf/local.conf
echo -e '\nINHERIT += "testimage"' >> conf/local.conf
MACHINE=gem5-arm64 bitbake core-image-sato


I'm running debian-10, which is probably why it was not seen by
others.

Thanks,
Jon


> 
> Bertrand
> 

> 

