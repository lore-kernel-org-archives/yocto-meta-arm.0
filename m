Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
 by mx.groups.io with SMTP id smtpd.web11.8654.1604588596671301460
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 05 Nov 2020 07:03:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=q4TmeN8B;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.182, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f182.google.com with SMTP id z6so1409634qkz.4
        for <meta-arm@lists.yoctoproject.org>; Thu, 05 Nov 2020 07:03:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=EyY/J6crFCcp2ONYJrrKmyrKIopiSbzxKVKQaciuFoI=;
        b=q4TmeN8BBJn04u8Vvh294QtP6+kvQQzVRUeOzQVDnOhiRVRmKGr+84q0DuLJFoWHCW
         tf0HxVaNneP6nLZLXRh1rIA6rPQFZaWQl5GZS5wGjcMkX4WNyuDp640MPlJyBD5GFdiG
         51GfVk7epY4lhvYjmiwkLt8+Nbdd9T3Y+ZDQVyCAwNYWE/c/PgLjIL/gxfMfNxt/LC50
         Nce4hVUBIYJoRq7P2aisP8EidXrLdBpUCSC7dQ+R1nDr6IwEmYJLHolyTmJt82gtnMhX
         DqVJeA2YW7Gm9S+cdkifiUSsVxEgyRpeD7AGt7BiFt+b5f6nfcc4ELTOyrKtAeDCbF3S
         oZDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=EyY/J6crFCcp2ONYJrrKmyrKIopiSbzxKVKQaciuFoI=;
        b=Ty+cAlQ2zmGF4F+nqOVi0NeRk9V8m4lWu+W2kWSSJf9Jk27G8KpABEDDZT6YrG2fiR
         Zh4PAE5G5suW7uEvCkNbKWrdQ3UbQKvqwQeY3r3PWWWcX4kBjWKB3k4we2D9HpzGccnn
         BE/aYSw1OZrlXkUrX7VPitfJYk81JkfhTZ6LN/OHrVlVnHl2dNHAnhyABQsREmxhdjw6
         uWtrBR5r/Jj3iSCAocyT94UmKIL1y/pB/OeQ1sPxP6hoQ+9c2NjcMVjo9FTXfH2ISJol
         hP3B8tQowA56WQ0Qn8SEghidRblq/YelNxdIBvxCRFAxNhYpFfCbKgdNH5gE7cNqvlMb
         1Omg==
X-Gm-Message-State: AOAM533NoDUzbexTCnXFpcWqmnPMuTPjCJRomMlNpsaGE08+kGSTcbpc
	vDXg1ezdDCq1qsEXD4YOypwW7eaM1Zik0Yc8
X-Google-Smtp-Source: ABdhPJyDaUqk3kJStHauCdXgPmSLu7cX4WpE7uOUAx2IiXpuqpl9VJ5VP64LM2ts9/L3PLw9G6eDoA==
X-Received: by 2002:a05:620a:142d:: with SMTP id k13mr2369110qkj.315.1604588595577;
        Thu, 05 Nov 2020 07:03:15 -0800 (PST)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([136.56.1.171])
        by smtp.gmail.com with ESMTPSA id p5sm1078300qtu.13.2020.11.05.07.03.15
        for <meta-arm@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2020 07:03:15 -0800 (PST)
Date: Thu, 5 Nov 2020 10:02:54 -0500
From: "Jon Mason" <jdmason@kudzu.us>
To: meta-arm@lists.yoctoproject.org
Subject: gatesgarth freeze and pending release
Message-ID: <20201105150253.GC26392@kudzu.us>
MIME-Version: 1.0
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

For the week, we will only be accepting bug fixes for the meta-arm
gatesgarth upcoming release.  We are currently waiting on some fixes
for known issues, after which we'll cut the gatesgarth branch.  After
the branch is created, we'll start taking patches again for hardknott.

Thanks,
Jon
