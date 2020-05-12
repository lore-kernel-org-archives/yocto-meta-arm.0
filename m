Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com [209.85.222.194])
 by mx.groups.io with SMTP id smtpd.web12.5076.1589242593208247044
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 11 May 2020 17:16:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=dqr/PUJI;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.194, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f194.google.com with SMTP id f83so11875794qke.13
        for <meta-arm@lists.yoctoproject.org>; Mon, 11 May 2020 17:16:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=fulJHGdjt55vhzt67RycnakOKPM36pGCuOYZD55lS0A=;
        b=dqr/PUJIN0DmKcf8Jo9AFw6lzrFx8s4QVGr29CHLxwgYPHNXTG4u4NPxQnArkhqK1m
         HU19AMDPchffL+FF/74Giwl38Mwl9vfwHVyyNWOm/pDlOk+DevbbWdBbmoZAEt+wK1Om
         EYic7XNiGDBLTm0Ko3CEAjTdGcQio3KsUvMTj2zXjXfcqTRr18vhxUXJd8xv5G97giyK
         JX9Kwv/RLawXfuras1mD2/ljBnylln7vEEu3m8muFKIUEqg+ust99vVDwhs1Zr/c/HTb
         6ykL/zjB4zCe5lrkPUgWmz1IgEQjKxVDSnEqB4afF1hATXxEZ4RwrVT52k6EaM0QCTYH
         Gx0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=fulJHGdjt55vhzt67RycnakOKPM36pGCuOYZD55lS0A=;
        b=mcqIlbIQ/5dKZpSAOGYWtrcuM64+pO+sBUZU4BTBEpG/BZpA669aALPWUDH5Q/8wy6
         0NKhz1YIsDhaNnmo/hiGaZU8UhvJWlQC+tp+Jcf4wLOAE6gw+jS8bylvgeTnmv4VaQBv
         NY6MlIQHVzG3lHNubGPFwVOipsdoo9oF6MzGLyhDZ9tKVsJvOCfD5gUyDwAtfLOlXvF9
         jJ0XEeGxeNhJaJtkkPqgr3z48OzM7WSeDee6kMdWPrTiia5U2GltyqNEnKICXu42Xzmd
         FbUA8bJgEFAw+RWtbnKonqihhHlizNih0cIo0ok5VAD40DEmBREANWGT1iVucf3oIWPk
         KHYw==
X-Gm-Message-State: AGi0Pub1Ru2Q1ghlbKG5GvwW68eTnwidudUJKis9HkImOK2Oxy7KqyQH
	jVwGlDe/aag+nK2PkTsRoadr5g==
X-Google-Smtp-Source: APiQypKMgSbt24e+k1Ev1bN3oBPVqVds+K9tMI0QI2g12uwyk0IV8T2lR/LX9aNHWTCgWw6pwVS87A==
X-Received: by 2002:a37:8d6:: with SMTP id 205mr19496331qki.144.1589242592381;
        Mon, 11 May 2020 17:16:32 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a664:2e00:a1b5:1e25:173e:a7bd])
        by smtp.gmail.com with ESMTPSA id b11sm10798133qti.50.2020.05.11.17.16.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2020 17:16:31 -0700 (PDT)
Date: Mon, 11 May 2020 20:16:30 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Bertrand Marquis <bertrand.marquis@arm.com>
Cc: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>,
	nd <nd@arm.com>
Subject: Re: [meta-arm] [PATCH] arm-autonomy: xenguest-mgr: Add support for compressed partition images
Message-ID: <20200512001629.GC8026@kudzu.us>
References: <1589203766-65846-1-git-send-email-diego.sueiro@arm.com>
 <5A53E84C-1FB1-4FC5-BE64-0E1CA37285C5@arm.com>
MIME-Version: 1.0
In-Reply-To: <5A53E84C-1FB1-4FC5-BE64-0E1CA37285C5@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 11, 2020 at 01:36:02PM +0000, Bertrand Marquis wrote:
> 
> 
> > On 11 May 2020, at 14:29, Diego Sueiro via lists.yoctoproject.org <diego.sueiro=arm.com@lists.yoctoproject.org> wrote:
> > 
> > From: Kamil Dziezyk <kamil.dziezyk@arm.com>
> > 
> > xenguest-manager now can create guest partition
> > using compressed images like *.img.gz or *.img.bz2.
> > 
> > Change-Id: Ifaec0b7c301b2b316ebccdd0ca85083262f2714c
> > Signed-off-by: Kamil Dziezyk <kamil.dziezyk@arm.com>
> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Pulled into the master branch.

Thanks,
Jon

> 
> > ---
> > .../documentation/xenguest-mkimage.md              |  2 +-
> > .../xenguest/files/xenguest-manager                | 24 +++++++++++++++++++---
> > 2 files changed, 22 insertions(+), 4 deletions(-)
> > 
> > diff --git a/meta-arm-autonomy/documentation/xenguest-mkimage.md b/meta-arm-autonomy/documentation/xenguest-mkimage.md
> > index d77fd48..3dcc28b 100644
> > --- a/meta-arm-autonomy/documentation/xenguest-mkimage.md
> > +++ b/meta-arm-autonomy/documentation/xenguest-mkimage.md
> > @@ -62,7 +62,7 @@ The file contains the following entries:
> > - `DISK_PARTX=SIZE:FS:CONTENT`: create a partition number X (1 to 4) with a
> >   size of SIZE GB, format it with filesystem FS (can be ext2, ext3, ext4, vfat
> >   or swap) and extract CONTENT as initial partition content
> > -  (.tar[.gz|.xz|.bz2] file or img file to be dumped in the partition). FS and
> > +  (.tar[.gz|.xz|.bz2] file or img[.gz|.bz2] file to be dumped in the partition). FS and
> >   CONTENT can be empty.
> > 
> > The disk-files contain files to be used for initializing the disk partitions
> > diff --git a/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-manager b/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-manager
> > index 4777054..99975a2 100755
> > --- a/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-manager
> > +++ b/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-manager
> > @@ -262,12 +262,30 @@ function xenguest_disk_init()
> >             fi
> > 
> >             case ${content} in
> > -                *.img)
> > +                *.img*)
> > +                    decompress=""
> > +                    case ${content} in
> > +                        *.img.gz)
> > +                            decompress='zcat'
> > +                            ;;
> > +                        *.img.bz2)
> > +                            decompress='bzcat'
> > +                            ;;
> > +                        *.img)
> > +                            decompress='cat'
> > +                            ;;
> > +                        *)
> > +                            # invalid/unknown compression type
> > +                            echo "${PREF} Invalid file format in disk ${content}"
> > +                            xenguest_detach_disk
> > +                            exit 1
> > +                            ;;
> > +                    esac
> >                     # dd into partition
> >                     echo "xenguest-mkimage extract-disk-file ${guestfile} " \
> > -                        "${content} | dd of=/dev/xvda${part} " >> ${LOGFILE} 2>&1
> > +                        "${content} | ${decompress} | dd of=/dev/xvda${part} " >> ${LOGFILE} 2>&1
> >                     xenguest-mkimage extract-disk-file ${guestfile} ${content} \
> > -                        | dd of=/dev/xvda${part} >> ${LOGFILE} 2>&1
> > +                        | ${decompress} | dd of=/dev/xvda${part} >> ${LOGFILE} 2>&1
> >                     if [ $? -ne 0 ]; then
> >                         echo "${PREF} Cannot populate partition ${part}"
> >                         xenguest_detach_disk
> > -- 
> > 2.7.4
> > 
> > 
> 

> 

