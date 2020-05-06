Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.web10.169.1588786226219480280
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 06 May 2020 10:30:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=IJz7rw0u;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.50, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f50.google.com with SMTP id c4so1163752qvi.6
        for <meta-arm@lists.yoctoproject.org>; Wed, 06 May 2020 10:30:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=K4BkKJOe9tFv5hKv1M6c96AqwqAgZbVrluCp2hggGaw=;
        b=IJz7rw0u7fW7SG4hHZjs7ZEKGgJc67E/wYM875S1+3iLL82U9LJejT+i7XDdpNWIop
         jYLr6nnxHBt31VaTxORLpO+9LgHC5207Railh6mQBi6L+NW8J9IRTL6zOt7qEmrn8ZaN
         qjJ191DVtL9Rp+17dRmN666VyDmnCKQkagubndIvGk/LjWUBbzM98Y7jrve6ne87i5WU
         NChgFuDEpyY4fK8UhdPCqFILUDvODvEXGXSyyg6z+WWMaVdPfV52kwzegDK+6tY6csJa
         9V0U31GEz2EW2y/lXS8LJvY5P8gKQHDlheaS6+IQq+KQEZrcZjjxbn+we5QVfQb0m472
         rnpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=K4BkKJOe9tFv5hKv1M6c96AqwqAgZbVrluCp2hggGaw=;
        b=Q8z+lZI9DUUoEShQwqsoUdGlaVfdeKym6gNyeuN3HKBMyg4wWix2M2jYjoN3T2i+s9
         WoTcIN6qhUsfvc/pzm2z+smUxOV+E+sg1xEpLDcLcyhAxGQQtGkfhdbywpgrpVG0JHqC
         qBWyu3pLTeAO3FhHQyBP8a2CIp7WStEoNX4EXMfZd8XiPvhfuHbpnCpbEFkQ1pWoZu+k
         cw/CVrX13d4aq+ez+YsPOWbnbEHiWPy8hSHJxfa65nVGC6sFxWnshIdOIR7EAAJZA7LE
         tTwu0Ae86UcPHhfeW8ds4Z7ttnzsqKrjCUbTZU/ExMl0hGXA4+rPHf98B8xKeuaPXT1R
         n/PQ==
X-Gm-Message-State: AGi0PuaV7xVRcTRTGSBEzePHwCU4eSAA//HbZAyzqiJtzP31fP0h+KsM
	BEwuA78DbP+eNI78l8Gy2v0NZPQnk2TdDA==
X-Google-Smtp-Source: APiQypLlgsxq8A8Rr26SYea0GMA1YAxaLahV3Mj17uUuQ2Tfs3UoGLTN9e+xJA8eshwubz5L6cUjPg==
X-Received: by 2002:ad4:42c9:: with SMTP id f9mr8689154qvr.228.1588786225069;
        Wed, 06 May 2020 10:30:25 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a664:2e00:1068:4212:6fd:289b])
        by smtp.gmail.com with ESMTPSA id u5sm2110684qkm.116.2020.05.06.10.30.24
        for <meta-arm@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2020 10:30:24 -0700 (PDT)
Date: Wed, 6 May 2020 13:30:23 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: meta-arm@lists.yoctoproject.org
Subject: Issue with arm-8.2 GCC and a5ds
Message-ID: <20200506173022.GI22996@kudzu.us>
MIME-Version: 1.0
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I'm seeing a compilation error building trusted-firmware with Arm GCC
8.2 for a5ds.

ERROR: trusted-firmware-a-git-r0 do_compile: oe_runmake failed


|   AS      plat/arm/common/aarch32/arm_helpers.S
| lib/aarch32/misc_helpers.S: Assembler messages:
| lib/aarch32/misc_helpers.S:26: Error: selected processor does not support `smc #0' in ARM mode
| make: *** [Makefile:879: build-a5ds/bl1/misc_helpers.o] Error 1
| make: *** Waiting for unfinished jobs....
| ERROR: oe_runmake failed
| WARNING: exit code 1 from a shell command.
| ERROR: Execution of '/home/jdm/yocto/poky/build/tmp/work/a5ds-poky-linux-gnueabi/trusted-firmware-a/git-r0/temp/run.do_compile.24298' failed with exit code 1:
| Including bl32/sp_min/sp_min.mk
| Building a5ds
|   HOSTCC  fiptool.c
|   HOSTCC  tbbr_config.c
|   HOSTLD  fiptool
|

I've not done any debugging, but wanted to document this incase anyone
else comes across this.  I'm not seeing any issues on arm-8.3, arm9.2,
or the GCC included in Yocto Zeus.

Thanks,
Jon
