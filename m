Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9887.1792769821656413369
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 23 Oct 2026 08:37:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20251104.gappssmtp.com header.s=20251104 header.b=pjblfvAg;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.176, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-5351d76e1baso11217571cf.1
        for <meta-arm@lists.yoctoproject.org>; Fri, 23 Oct 2026 08:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20251104.gappssmtp.com; s=20251104; t=1792769820; x=1793374620; darn=lists.yoctoproject.org;
        h=content-disposition:content-type:mime-version:message-id:subject:to
         :date:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=M6dPODIM8khPdSrDfihrV/fZ4aPrWPaZMwZIkdhVpgs=;
        b=pjblfvAgu+W6SI1ZbdSN+8pEzmDQQ2QfN0DxtH2mqywzwtn9JiKZMzw85FD+cYyjis
         Qnb4W+q0tjthga5AzWm9sUtRSolzoP7cwnzHkehUlozG4NQ8SQwg71+IPT5i5MaDV+29
         l9wXsQeuIrwwLfURrPsAHCKmJVBR0srhZK24wzpU3yROekLtLgSLIDsko8T7W912of5v
         MCnv/bvwFObipYZSDByR2U4bn9LMXpKYL7ibPV47Z306vmjayr41rGyk7kYbTv7JpD9Z
         Ap/KUKlrVDp0k9zSbZg4GBnlWxR2YBf8uaLj/5s1TXFbnUOVRRydodooBpFjMj9VkHtB
         EbaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792769820; x=1793374620;
        h=content-disposition:content-type:mime-version:message-id:subject:to
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M6dPODIM8khPdSrDfihrV/fZ4aPrWPaZMwZIkdhVpgs=;
        b=t2Y4G70XsPXTdLnHMo21E4mhfQtYsEOQf6T14p/UdtjZ4NN+UqZlcdh7Zow4nRe0yz
         Ki+uGvc2s8bFbwiVv3V3i14ZE29ewokfinLsWOIUZbfkbesG2Pfk8icBg1mlrTxspzBe
         W3yAVODgsumn7l4nE+UJGReuhytnhVO7Lgom/V0Pnk2Eg4rVL3YqHWBSqRknBnmLGSXG
         IZL2YUQohHZOHKhMQCZ0x+McbO5zpDYkANtHQ5jj0uDeuKAfYm4bY77eez6UfRQGx7xE
         tvHqELe1Gkbw4XkBUJoJOC+8W5pOyjKPDdF5zXkTrg95vSYjbbQRsdEYR5DB7YCeeq96
         RLSQ==
X-Gm-Message-State: AFq9FYI2CwEu/HapvjGyMdNWOkkLffyyumwj7G898bNfWNSfCPefY8Ig
	/VtSv/oy7Rjef385eh6uUCDU5+/VfjKunfOcTSyejRuY9UfdMEjtiRCyFVXxsDua2WIzXvrZMjM
	36BI=
X-Gm-Gg: AYBFou3w4aNFEyC36zlan6QugVWT1zFLvueB6r/GLKAOpRr7/X5N1NxbJggrMmwyLot
	zv0V2aFk3yvHyR6o5DRZMxqbU6bOQ90evT3uSPhSuf7zkB3/gvjQN/jnsk/+7yr8zU+8A6JOPOQ
	A9tzMW7noHOcurCtv38wD3fXkey1UbXmT7dnft3fkNGjVjMoEoVJEIY8VvdIVbTUIihF7GAgglz
	OmYswTIxu/HK81eLAItgh9P1XZshRQCeTkhYSvqTE8E2Yht0em/nRlQRUC/YZ3OvqSd71M1QxgB
	ns+rHTLS9ekxsf7mx3LbdKjxo44s1lVjzzyNsui8YudGdJRA7ipGhcj00SkdqZgd0urCEVuRHHC
	eljz96BefDrJXZ+gGUGoL/dW6B8wyNGwj8hOOdpBORI/8S3LiJbbIXerRzuVs5ecXVEfAooRwVI
	BnvpIkjP6foSAF+r1x+GisP6HsL2+PboY6mfBCjBGS8IgDEPuyFrCnRT2ovngzgCGrOJjtF4Uj8
	fYvjxArKDuNVlUJE3DoswhSUt3KieAtkflT5ra0Vwyh4g==
X-Received: by 2002:ac8:5d0e:0:b0:533:39eb:8d42 with SMTP id d75a77b69052e-536ae11b871mr100053611cf.21.1792769820306;
        Fri, 23 Oct 2026 08:37:00 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from localhost ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-53836c431a1sm209931cf.22.2026.10.23.08.36.59
        for <meta-arm@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 08:36:59 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jdm@athena.kudzu.us>
Date: Fri, 23 Oct 2026 11:36:55 -0400
To: meta-arm@lists.yoctoproject.org
Subject: meta-arm wrynose release
Message-ID: <att_F5gflamtBfWG@athena.kudzu.us>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-arm@lists.yoctoproject.org>; Fri, 23 Oct 2026 15:37:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7199

meta-arm has released the wrynose support branch, tagged as 6.0.

This is a Long Term Support (LTS) release. meta-arm generally aims to follow the Yocto Project's LTS support lifecycle on a best-effort basis, with maintenance primarily focused on bug fixes and security fixes. CI testing is performed on supported configurations as resources permit.

The currently supported LTS branches are scarthgap and wrynose.

For more information about the Yocto Project's release lifecycle and LTS policy, see:
https://docs.yoctoproject.org/ref-manual/release-process.html

This release contains 147 commits since the previous Yocto Project release, 5.3.

The release is available under the 6.0 and yocto-6.0 tags.
Both tags are GPG signed.

The wrynose branch was created back in April, but we forgot to tag the release and send the email.  Apologies to everyone for this oversight.

Thanks,
The meta-arm team
