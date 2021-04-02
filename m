Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web12.18618.1617379365497914726
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 02 Apr 2021 09:02:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=fvmylNJC;
 spf=pass (domain: burtonini.com, ip: 209.85.128.47, mailfrom: ross@burtonini.com)
Received: by mail-wm1-f47.google.com with SMTP id d8-20020a1c1d080000b029010f15546281so4508088wmd.4
        for <meta-arm@lists.yoctoproject.org>; Fri, 02 Apr 2021 09:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3BuorhKEE95hxDOHT44g+kZgrICQA+VgskhHRzwASbE=;
        b=fvmylNJCEWk7HoQy4/UKu0bjF/MykpyU/ZU+Yk2UWwpMNfD4sGNexJHp6fAeFHRRuS
         3ZGBTprQfsYxnZbaUzYS2ZfhK89EkC00KfJT27vV6qYGsV6dgiBM3WEZnN1KoFhlEmiz
         E6ssz69ro4YCwy4jISrd2k2QB4BIJBgQW1rdr4WPZoz5oxu3JK6uBrf6t2NYUfDEO9mW
         R04WlNon2NVUmRp3ycYgfFIkSgjt8S6+uJyeOx8Fwf/nfoT4ovC1zs/HjQxuk7wfid3T
         Z5q3w0QxSLCK5TgQOA7+sGdoi+xyU2cYonPxAKVueSzucFzjevhPJRnYzQejg1IjKyjX
         GFEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3BuorhKEE95hxDOHT44g+kZgrICQA+VgskhHRzwASbE=;
        b=EReNoeepxC+nBA2yMOV5HWQtrAnbXYvZCfdV1g8CTy3s7M5kgNAvLfddMp/YX1GpjA
         VhitQUYTfJhek3F+5EEpGtvfgVTceX6UqhB7XCZfrmYgO3eNDzf1n9BOPSgMDUFLK6NO
         ZKOQPK3Q1YZXy1NAkxEIaJNoABnLMN7Yf4UtaJkUUzNInsD60GCv4mNY3YBMC29Diw+3
         aFii9hpH3MNTKUISNolqyG6VnsXF4uGGJKKd1sqEpud3N8mTX2npRBJ+nperLLyCFrEX
         EQNDVEqc4GOyr+bR/zg30VAeISt5k5mDPOt7JFDkVZzgxM19+rjOvgvUdTIoPXOHE2lI
         kzTw==
X-Gm-Message-State: AOAM531EmFyYkRGFuHZWfwttbrlJmqoKeYgTZAeaL9dAPpj48fm6OY2F
	uuov9gJsekExXTqISTQT/ZkDZDigzqHBvQz38e6QcQ==
X-Google-Smtp-Source: ABdhPJyfqfyZ0WJRCYfmFj1Vg2wpX/t3YUJdCVy5mQ8xDfHvkgrHzpMPX/Xa9paj9lsSzJBzAyknIZ20kSazdoG3pyY=
X-Received: by 2002:a1c:6855:: with SMTP id d82mr13711707wmc.169.1617379363735;
 Fri, 02 Apr 2021 09:02:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210401092922.2585351-1-ross.burton@arm.com> <20210402152615.GA5054@kudzu.us>
In-Reply-To: <20210402152615.GA5054@kudzu.us>
From: "Ross Burton" <ross@burtonini.com>
Date: Fri, 2 Apr 2021 16:02:30 +0000
Message-ID: <CAAnfSTszwtSXRiFuS2S0uEP20b1VKBPWUTf7ok7FMzv8oUrF3Q@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH] arm/sbsa-acs: add SBSA Architecture Compliance Suite
To: Jon Mason <jdmason@kudzu.us>
Cc: meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 2 Apr 2021 at 16:26, Jon Mason <jdmason@kudzu.us> wrote:
> Applied to master with slight fix for reference to recently updated
> (by you) EDK recipe.

Whoops. Thanks!

Ross
