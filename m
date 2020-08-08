Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
 by mx.groups.io with SMTP id smtpd.web11.3490.1596885508725327732
 for <meta-arm@lists.yoctoproject.org>;
 Sat, 08 Aug 2020 04:18:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=OOD9yqbc;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.171, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f171.google.com with SMTP id p25so4088216qkp.2
        for <meta-arm@lists.yoctoproject.org>; Sat, 08 Aug 2020 04:18:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=VEuKv/NTnG9AYPZFGLQTzrameNLoA15VF2b5+Wa2Q8U=;
        b=OOD9yqbc7KXY+rW+0bjz5P8tpC63ruGEYldhd3N8Q5fkzfTjw/7hs5HKOc+hQ4Wf6i
         pAMwu50YUGqEYQjEeaU1YXRnbWOA625j8lM0lqUnaEmKNShYz/jvencVf9f6fWxGnwFU
         yLItgJV+Z+iOiKlxMlj3QgPItey6uHr/PMsDfZk24dwqEgKGUfbS65G2WvQNNNqB6jgD
         YDPTPwQYb2d8xR64XamtU4iLIx8FscXOVFp6S6sQTPQXNJ3FjVxCjdfV5PDJe3hwcoGV
         HpULR/wSINr6a6UqK511d60dNaYMmTev1QNR+BTP6f6FfFVREvmVR5l/tLcEdLcW7N1a
         57Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=VEuKv/NTnG9AYPZFGLQTzrameNLoA15VF2b5+Wa2Q8U=;
        b=YkG3VheFnUdoFxBa6nkn5100W8a60n0s6Ekn8XchYulIJ1p0J1tDDol69wuCGUIT9y
         T/rZTDbWpeTuNmoIsm4Js7iitQ+WzoVcoxXuEWCkS3Bm1yL9QXCilDGgcoFhWn2Zbrt0
         Sn//HjTjgXy+xDAI+sb+ROYdfO+E6sR29tsXyd0DV4fjxhhOF8UiRZQYkbbiQHVgtQPj
         oY5p8M6jaPa+6z9ON3bS5QeGAa8PlHQNDQPe9lsCVBD/hm83yyhSJdami/Mpvc1H6u+5
         F76UZZZyGeKkLOIzp/XIbaS29+KuBLCGoRdg47E/MKhsVyWNuSRwsCdAKswmzeaMY1po
         sh4A==
X-Gm-Message-State: AOAM530+t7VTHE3yaTR1BPLtEFTc/rfEBD5EPXzwRSWGnAFLuDMF4EMd
	euGJOtPfvSXwSMug9pMUpbxtrkEwyVNvKw==
X-Google-Smtp-Source: ABdhPJxZX6LCF0dWCehUPtWn25wn8IAErcE33k7WE604Zx+AI+y7Tn0vxsLG/25mTdi1YWqEFlu3Xw==
X-Received: by 2002:a37:6482:: with SMTP id y124mr18189758qkb.470.1596885507571;
        Sat, 08 Aug 2020 04:18:27 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a61a:4700:6899:3cff:babc:eecd])
        by smtp.gmail.com with ESMTPSA id c205sm8912503qkg.98.2020.08.08.04.18.26
        for <meta-arm@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2020 04:18:27 -0700 (PDT)
Date: Sat, 8 Aug 2020 07:18:25 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: meta-arm@lists.yoctoproject.org
Subject: TF-A patches from master to dunfell
Message-ID: <20200808111824.GB5087@kudzu.us>
MIME-Version: 1.0
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Does anyone object to me pulling the following from master to dunfell:
commit 5b2d4560938ea75cc7c4064d067bf681f0f20ae6 (HEAD -> dunfell)
Author: Ross Burton <ross.burton@arm.com>
Date:   Tue Jul 14 12:03:45 2020 +0100

    arm-bsp/trusted-firmware-a: move machine customisations to the versioned appends

    By having MACHINE_TFA_REQUIRE set and required in both the wildcard
    bbappend and the versioned append, the same file can get included twice
    which results in a warning from bitbake:

    WARNING: trusted-firmware-a_2.3.bb: Duplicate inclusion for
    trusted-firmware-a-juno.inc in trusted-firmware-a_2.3.bbappend

    Move the customisations from the wildcard bbappend to the specific
    version of trusted-firmware-a that is used for that platform to be clear
    about what platforms are supported and remove this warning.

    Change-Id: Ib220aedbf94fa11d21ddc6c5f9ac2c5de5c66b7a
    Signed-off-by: Ross Burton <ross.burton@arm.com>
    Signed-off-by: Jon Mason <jon.mason@arm.com>

commit 8b7ec0affa343631ee9877f3e8ccd2731d6f8a52
Author: Ross Burton <ross.burton@arm.com>
Date:   Tue Jul 7 17:24:58 2020 +0100

    arm-bsp/trusted-firmware-a: move A5 DesignStart to 2.3

    0001-plat-arm-a5ds-move-dtb-to-a-new-address.patch was never applied,
    and has been merged upstream so drop it.

    The recipe was using the _git.bb recipe and setting the SRCREV to a
    commit 300+ commits past 2.2 but not quite 2.3.  Instead, just use 2.3.

    Change-Id: I76aee592e7ce3ec23268872d7f202efa945e5e59
    Signed-off-by: Ross Burton <ross.burton@arm.com>
    Signed-off-by: Jon Mason <jon.mason@arm.com>

commit 96248a0eac73e990b767813c9b4e698fb76cf896
Author: Ross Burton <ross.burton@arm.com>
Date:   Tue Jul 7 17:24:59 2020 +0100

    arm-bsp/trusted-firmware-a: consolidate FILESEXTRAPATHS

    There's no need to set FILESEXTRAPATHS to "${THISDIR}/files/n1sdp:" when
    n1sdp is the name of the current MACHINE as bitbake will search for
    override-named directories automatically.

    Instead just add ${THISDIR}/files and let bitbake do it's thing.

    Change-Id: I0f58933ff9e56ee41a8fdd55f467d263c4e1b1e7
    Signed-off-by: Ross Burton <ross.burton@arm.com>
    Signed-off-by: Jon Mason <jon.mason@arm.com>


It corrects the issue on dunfell of:
WARNING: /home/jdm/yocto/meta-arm/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.bb: Duplicate inclusion for /home/jdm/yocto/meta-arm/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-juno.inc in /home/jdm/yocto/meta-arm/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.bbappend
WARNING: /home/jdm/yocto/meta-arm/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.2.bb: Duplicate inclusion for /home/jdm/yocto/meta-arm/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-juno.inc in /home/jdm/yocto/meta-arm/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.2.bbappend


Thanks,
Jon
