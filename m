Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.3031.1596017516412189928
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 29 Jul 2020 03:11:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=ek8CjLOX;
 spf=pass (domain: burtonini.com, ip: 209.85.128.44, mailfrom: ross@burtonini.com)
Received: by mail-wm1-f44.google.com with SMTP id x5so2190801wmi.2
        for <meta-arm@lists.yoctoproject.org>; Wed, 29 Jul 2020 03:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=WCWLsGHMXb7huxTuLlbf6aO9uEHZbxyxGL/nTsrWxn4=;
        b=ek8CjLOXCw63qEwvgurbN8qHvpwK8U0JaFKhk3UkMckBDzfL3NwVjTkfTaguicCi8T
         TVJ8sf7b531UFEztjBtY5Ius2HHMI5Bh0lmezt42bFqEzNL9zQgJraJMBFbqZw6rWiiJ
         lhZeziMkO7twV8osV0Cv2GnlzuYpzKOBI4AEPSRKTVHK5y8rE/LhzX9Ybjzw/nc4GHHe
         5+akeByWZnlvWrWnoHNdl6LEHiR12kLEKVFRca457FgE4UsUlawySkh5fvFGdxetiyx3
         yBbemzeSC86Ulp+mQW8djScYQddhkkd+ew6SndPx6i3ZF9U3mRktUkU7n7kec7dhzSdq
         pfHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WCWLsGHMXb7huxTuLlbf6aO9uEHZbxyxGL/nTsrWxn4=;
        b=qTC3ZRoZBXbZpwl9cnKxe/y8OqX5Ey7lBql/OEgXnya+KKyWO9gu0KzBjEFNTRRjMJ
         oo5yIV95JcLd0vtps9qFM2ZblxKgN3KQKVmQs/vq0ipVWk36MhfKZ0LOGQCqNHYHcnop
         nMW86tsJlbJoJ64VhE+jC/wIddUcoq2HZAAHLpbuyTVyUcaZkJyZTL2HpXYwHGIzKrQu
         frzVdNtxyQHGHNIv+DBYHMeY2Rkvfd1eRs/7p6l6g1VWz5Mvn5LQ5SoHKH1Yvw0LGR1k
         8fD8EzTXlBhkLbDpfPRIxUsHNrni+IR/c/aVRvX4trEDO6d5SuOyofkBatq2NoV1WqZZ
         igyQ==
X-Gm-Message-State: AOAM533FHbpUdGDuZB3C6SHPxecJRGhFJk2XCZBCZCf1ivTA+xC/HvtT
	vyIKNQQAtSONX43NmVeTWaGgMt6gkOtra84H
X-Google-Smtp-Source: ABdhPJyuplzdOoxTitjTMKC8T2r9O+rMOh/wTav9kyEumuMoGNtAVI6zE2syv0O7u1FJ5kyfm53YOQ==
X-Received: by 2002:a1c:23c2:: with SMTP id j185mr1277275wmj.84.1596017514778;
        Wed, 29 Jul 2020 03:11:54 -0700 (PDT)
Return-Path: <ross@burtonini.com>
Received: from rossb-vm.manchester.arm.com ([213.86.15.71])
        by smtp.gmail.com with ESMTPSA id h11sm4648780wrb.68.2020.07.29.03.11.53
        for <meta-arm@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2020 03:11:54 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 6/9] arm-bsp/scp-firmware: use wildcard bbappend
Date: Wed, 29 Jul 2020 11:11:42 +0100
Message-Id: <20200729101145.1794231-6-ross@burtonini.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200729101145.1794231-1-ross@burtonini.com>
References: <20200729101145.1794231-1-ross@burtonini.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ross Burton <ross.burton@arm.com>

This doesn't care what specific version is being appended, so use a
wildcard.

Change-Id: I5e3a46c42616f8dfa62a20549c03b60e24fe8b20
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../{scp-firmware_git.bbappend => scp-firmware_%.bbappend}        | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta-arm-bsp/recipes-bsp/scp-firmware/{scp-firmware_git.bbappend => scp-firmware_%.bbappend} (100%)

diff --git a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_git.bbappend b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_%.bbappend
similarity index 100%
rename from meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_git.bbappend
rename to meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_%.bbappend
-- 
2.26.2

