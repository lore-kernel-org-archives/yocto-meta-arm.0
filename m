Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
 by mx.groups.io with SMTP id smtpd.web09.5215.1616045311625484375
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 17 Mar 2021 22:28:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=JUid4xvJ;
 spf=pass (domain: gmail.com, ip: 209.85.222.172, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f172.google.com with SMTP id f124so904144qkj.5
        for <meta-arm@lists.yoctoproject.org>; Wed, 17 Mar 2021 22:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=hma22nTxHJbN8NMh03SA8pALxGHue8vHwH3hxw81hR4=;
        b=JUid4xvJrdYrImx9lPqAM7jqiDZKAUDP+nZuQud25Jin/GzsKHTxYqAJoThvp3Qzid
         NavxLN3LzR+gTSvzdmOfJGRFYYHrx05w/643Z/7GKHCbUfYSJcfmAKN89J3KLTyoYDL/
         Jio5uh7WpaMNz1DYTdCkYPKeQSQgjErZr/+J5v8Fbi21Oq/O2mEwMhR8GtDfgXNtsntN
         dk+08fILtTV+fKQmAgXydEvdwtsYBBNMkUgUiMu5z0MsBJT2Zmz0vOOvdTt7bhsmCPI8
         Keos+rtSPqCmeNgUtWGOouboszM95uKO6Ii0L8qnQk5Ta26OQELeiyDVpTdzWnwc0+Dg
         3syg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=hma22nTxHJbN8NMh03SA8pALxGHue8vHwH3hxw81hR4=;
        b=Cd5yxIrbdV6U83BNeIjp6ekEitZqB/pwNl5tdWF/YTmN7AoNt8VJB5+ad376LpW4h8
         7d8FIbOuTdn6ENyucUcNupfmGwZDH6Utm1jOe+Zc5Sqt/YTUAT7SC3T7mkVPb84REYKu
         ISexaPgl/sNAXmcXIQug9AkPtYhfwSKVnaIekD92gltlXvwraKcrAtVNseRGAy/n4Af1
         brKFjbidwOoqgKCtY9zBJfDYYL3fvdLDgtjeejOYyzxyWuBI7kMsXr09xbaQx+spvaW7
         /hQW45y/q7x92Qmft6nPqz8fwkkyGo9L1DifHIsn8gYzwcaYKQrh7MOJtm1zIsWRMd2o
         292g==
X-Gm-Message-State: AOAM530hLsUoSkHoVrlqDlf//j3LG3EVaXORyV0oiyLIiEkmDbRd71rV
	/5DE4jk4A+ILq300dJRhezpi9zo6OqcmRKobsUVx1pyj2keRTw==
X-Google-Smtp-Source: ABdhPJwi6myW9r8hMPdqEotBzhqjsQ5/a5Q+SfYOSTy2qNny2AkzQsi3Zb1zV7hQ3aI1IONqq9osJ5XESM3MIdqyxEU=
X-Received: by 2002:a37:8ec4:: with SMTP id q187mr2740184qkd.381.1616045310286;
 Wed, 17 Mar 2021 22:28:30 -0700 (PDT)
MIME-Version: 1.0
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 17 Mar 2021 22:28:04 -0700
Message-ID: <CAMKF1soMNKrKD6Pi94wu6KHUE83rY-zDdurWRtJjbOb=pXDmaA@mail.gmail.com>
Subject: python3-intelhex recipe duplication
To: meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

Hi

I see this

http://layers.openembedded.org/layerindex/branch/master/recipes/?q=python3-intelhex

so we have python3-intelhex copies in meta-arm and meta-python, We should

1. Upstream is to core and delete all existing copies
2. Remove meta-arm copy and let meta-arm depend on meta-python

What would you prefer?

Thanks
-Khem
