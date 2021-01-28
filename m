Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web11.215.1611859455664367873
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 28 Jan 2021 10:44:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=MbWxcR47;
 spf=pass (domain: gmail.com, ip: 209.85.208.50, mailfrom: raj.khem@gmail.com)
Received: by mail-ed1-f50.google.com with SMTP id g1so7823923edu.4
        for <meta-arm@lists.yoctoproject.org>; Thu, 28 Jan 2021 10:44:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=1H5NZJZ2MxSjH6Ckfs9CZx1LFYTFi/I4ZwQRt0kFVbc=;
        b=MbWxcR476atmPpYu6OiRp50f/8Tom0EzXKEryi1hOTB89bHUwK9XomVj3Byi/GCH+e
         xKIRVYoUok792Zez0U9ZX9nPLC5Y5dZKBXnmlXTNv9EITfl8XY1bHxzOQG7sKEeOdX8C
         G+OfDhaBNxVCVx/HK1Y+H6RvNSwsRv6Wp0rdFscJdA4ZXkJiqROWJnXB/nH4EZQbmuwW
         QAIOIEZqfm/g21XF9FQr44c2XTMFklK+UwLrVBPuzUx1UKVU/HodAqvCrMACF6n1wdDl
         nfe3+9UknDLsDoy5GF2sqPs4q2ZSdDb9NzCEvV4CfplFFDdmkcES5MOj1O842T8noPkE
         tksA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=1H5NZJZ2MxSjH6Ckfs9CZx1LFYTFi/I4ZwQRt0kFVbc=;
        b=uF0jtid8n4Fj2RTy6wc698yHvtH/fx0XBFNLJb3kN9mxA85ZJY0edZEPoUz40pij5M
         7pyTx8IugXbwmWNy6K0fgc3ZtsaxFWN3ZGHP5LsFlao8HTX7VVEeRdul8l71EsV1xrkR
         8TYScD8oKWmjuVlYGk6//bjRJux/B7lCo+SfrlNAYNjmQkqbblb1yA3fdvM07qN53TvT
         y0ZVqlA2tFzVSoucXgbTBoKVYNkWWeTJWYw0iJwJUvvkt0dEEZTEFqLHWnqGlpIspC0d
         snxoP8ED71V7IXy4lgfFspu7BjVtAvsrE18YuS9DqBNvCePJkrGVOrrapd8V0Y9uZIEB
         AiOA==
X-Gm-Message-State: AOAM530GKkbzXfDZRDCwamfpCGtP40jqmlKlyB6B802VZ0QtWLvDWr8e
	5TGYlhn6m1R/It/3FrYLi9dmfR+hosZ7K14LegM=
X-Google-Smtp-Source: ABdhPJz9aU9AVjcTzHzOvnUZDhMG8Y+NHxmQrcNCI+E/wGUWdQVePB/cLn2HbtfmrK+oArKDMG3LD9mfciomNu64xUM=
X-Received: by 2002:aa7:d610:: with SMTP id c16mr1099647edr.354.1611859454099;
 Thu, 28 Jan 2021 10:44:14 -0800 (PST)
MIME-Version: 1.0
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 28 Jan 2021 10:43:48 -0800
Message-ID: <CAMKF1sox8e6OgAYwzPSinah7kk6YcYbn6HRUZFgd_H5C27Ss=A@mail.gmail.com>
Subject: preferred version arm-8.3 of gcc-cross-aarch64 not available
To: Ross Burton <ross.burton@arm.com>, Jon Mason <Jon.Mason@arm.com>, 
	meta-arm@lists.yoctoproject.org, Cliff Brake <cbrake@bec-systems.com>
Content-Type: text/plain; charset="UTF-8"

Hi All

We have started seeing this error. It seems related to meta-arm. We do not want
gcc from meta-arm but it it still trying to creep in. Please help out.


https://github.com/YoeDistro/yoe-distro/pull/518#issuecomment-769242387

Thanks
-Khem
